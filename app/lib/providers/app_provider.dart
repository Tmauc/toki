import 'dart:async';

import 'package:collection/collection.dart';

import 'package:omi/backend/http/api/apps.dart';
import 'package:omi/backend/preferences.dart';
import 'package:omi/backend/schema/app.dart';
import 'package:omi/providers/base_provider.dart';
import 'package:omi/utils/logger.dart';

class AppProvider extends BaseProvider {
  List<App> apps = [];

  String selectedChatAppId = "";

  bool isLoading = false;

  Future<App?> getAppFromId(String id) async {
    if (apps.isEmpty) {
      apps = SharedPreferencesUtil().appsList;
    }
    var app = apps.firstWhereOrNull((app) => app.id == id);
    if (app == null) {
      var appRes = await getAppDetailsServer(id);
      if (appRes != null) {
        app = App.fromJson(appRes);
      }
      return app;
    }
    return app;
  }

  void setSelectedChatAppId(String? appId) {
    final newAppId = appId ?? "";
    if (selectedChatAppId != newAppId) {
      selectedChatAppId = newAppId;
    }
  }

  App? getSelectedApp() {
    return apps.firstWhereOrNull((p) => p.id == selectedChatAppId);
  }

  void setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future getApps() async {
    if (isLoading) return;
    setIsLoading(true);

    try {
      // Performance optimization: Load from cache first for immediate UI
      if (apps.isEmpty) {
        setAppsFromCache();
      }

      // Fetch grouped apps and user's enabled app IDs in parallel
      final results = await Future.wait([
        retrieveAppsGrouped(offset: 0, limit: 20, includeReviews: true),
        getEnabledAppsServer(),
      ]);
      final groups = results[0] as List<Map<String, dynamic>>;
      final enabledAppIds = (results[1] as List<String>).toSet();

      // Flatten for search/filter views
      final List<App> flat = [];
      for (final g in groups) {
        final List<App> data = (g['data'] as List<App>? ?? <App>[]);
        flat.addAll(data);
      }
      apps = flat;

      // Set enabled state from server
      for (final app in apps) {
        app.enabled = enabledAppIds.contains(app.id);
      }

      updatePrefApps();
    } catch (e) {
      Logger.debug('Error loading apps: $e');
      // Fallback to cached data
      setAppsFromCache();
    } finally {
      setIsLoading(false);
    }
  }

  void setAppsFromCache() {
    if (SharedPreferencesUtil().appsList.isNotEmpty) {
      apps = SharedPreferencesUtil().appsList;
      notifyListeners();
    }
  }

  // Performance optimization: Debounced preference updates to prevent database locks
  Timer? _prefsUpdateTimer;

  void updatePrefApps() {
    // Cancel previous timer if still running
    _prefsUpdateTimer?.cancel();

    // Debounce preference updates to avoid frequent writes with large datasets
    _prefsUpdateTimer = Timer(const Duration(milliseconds: 500), () {
      try {
        SharedPreferencesUtil().appsList = apps;
      } catch (e) {
        Logger.debug('Error updating preferences: $e');
      }
    });
  }

  void setApps() {
    apps = SharedPreferencesUtil().appsList;
    notifyListeners();
  }

  Future<void> toggleApp(String appId, bool isEnabled, int? idx) async {
    var prefs = SharedPreferencesUtil();
    bool success = false;

    try {
      if (isEnabled) {
        success = await enableAppServer(appId);
      } else {
        await disableAppServer(appId);
        success = true;
      }
    } catch (e) {
      print('Error toggling app $appId: $e');
      success = false;
    }

    if (success) {
      // Update local preferences for app status
      if (isEnabled) {
        prefs.enableApp(appId);
      } else {
        prefs.disableApp(appId);
      }

      // Update local app state
      var appIndex = apps.indexWhere((a) => a.id == appId);
      if (appIndex != -1) {
        apps[appIndex].enabled = isEnabled;
        updatePrefApps();
      } else {
        Logger.debug("Error: Toggled app $appId not found in local 'apps' list after successful toggle.");
      }
    }

    notifyListeners();
  }

  // Performance optimization: Dispose method to clean up resources
  @override
  void dispose() {
    _prefsUpdateTimer?.cancel();
    super.dispose();
  }
}
