import 'dart:io';

import 'package:omi/utils/platform/platform_manager.dart';

class AnalyticsManager {
  static final AnalyticsManager _instance = AnalyticsManager._internal();

  factory AnalyticsManager() {
    return _instance;
  }

  AnalyticsManager._internal();

  // TOKI: All third-party analytics disabled
  void setUserAttributes() {}
  void setUserAttribute(String key, dynamic value) {}
  void trackEvent(String eventName, {Map<String, dynamic>? properties}) {}
}
