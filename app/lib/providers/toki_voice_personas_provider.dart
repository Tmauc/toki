// TOKI — Voice Personas Provider
// Manages state for the voice personas feature using Provider.

import 'package:flutter/foundation.dart';

import 'package:omi/backend/http/api/toki_voice_personas.dart';
import 'package:omi/backend/schema/toki_voice_persona.dart';

enum VoicePersonasLoadState { idle, loading, loaded, error }

class VoicePersonasProvider extends ChangeNotifier {
  List<VoicePersona> _personas = [];
  VoicePersonasLoadState _state = VoicePersonasLoadState.idle;
  String? _errorMessage;

  // Optimistic update tracking
  final Set<String> _processingIds = {};

  List<VoicePersona> get personas => List.unmodifiable(_personas);
  VoicePersonasLoadState get state => _state;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _state == VoicePersonasLoadState.loading;

  bool isProcessing(String id) => _processingIds.contains(id);

  // ── Load ──────────────────────────────────────────────────

  Future<void> loadPersonas({bool refresh = false}) async {
    if (_state == VoicePersonasLoadState.loading) return;
    if (_state == VoicePersonasLoadState.loaded && !refresh) return;

    _state = VoicePersonasLoadState.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await getVoicePersonas(status: 'unknown');
      _personas = result;
      _state = VoicePersonasLoadState.loaded;
    } catch (e) {
      _state = VoicePersonasLoadState.error;
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  // ── Name ──────────────────────────────────────────────────

  Future<bool> namePersona(
    String clusterId,
    String name, {
    List<PersonTag> tags = const [],
  }) async {
    _processingIds.add(clusterId);
    notifyListeners();

    final updated = await nameVoicePersona(clusterId, name, tags: tags);

    _processingIds.remove(clusterId);

    if (updated != null) {
      final idx = _personas.indexWhere((p) => p.id == clusterId);
      if (idx != -1) _personas.removeAt(idx);
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  // ── Delete ────────────────────────────────────────────────

  Future<bool> deletePersona(String clusterId) async {
    _processingIds.add(clusterId);
    notifyListeners();

    final success = await deleteVoicePersona(clusterId);

    _processingIds.remove(clusterId);

    if (success) {
      _personas.removeWhere((p) => p.id == clusterId);
    }
    notifyListeners();
    return success;
  }

  // ── Merge ─────────────────────────────────────────────────

  Future<bool> mergePersonas(String keepId, String removeId) async {
    _processingIds.add(keepId);
    _processingIds.add(removeId);
    notifyListeners();

    final updated = await mergeVoicePersonas(keepId, removeId, keepId);

    _processingIds.remove(keepId);
    _processingIds.remove(removeId);

    if (updated != null) {
      _personas.removeWhere((p) => p.id == removeId);
      final idx = _personas.indexWhere((p) => p.id == keepId);
      if (idx != -1) _personas[idx] = updated;
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  // ── Split ─────────────────────────────────────────────────

  /// Split [clusterId]: move [conversationIds] into a new unknown cluster.
  /// Returns the new VoicePersona on success, null on failure.
  Future<VoicePersona?> splitPersona(
      String clusterId, List<String> conversationIds) async {
    _processingIds.add(clusterId);
    notifyListeners();

    final newPersona = await splitVoicePersona(clusterId, conversationIds);

    _processingIds.remove(clusterId);

    if (newPersona != null) {
      // Add new cluster to the list; reload to refresh original cluster stats
      _personas.add(newPersona);
      notifyListeners();
      // Reload to get updated original cluster
      await loadPersonas(refresh: true);
      return newPersona;
    }
    notifyListeners();
    return null;
  }

  // ── Suggestion ────────────────────────────────────────────

  /// Accept "C'est Papa?" — names the cluster with the suggested person.
  Future<bool> confirmSuggestion(String clusterId) async {
    _processingIds.add(clusterId);
    notifyListeners();

    final updated = await confirmSuggestionApi(clusterId);

    _processingIds.remove(clusterId);

    if (updated != null) {
      // Remove from unknown list — it's now named
      _personas.removeWhere((p) => p.id == clusterId);
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  /// Reject "Non, ce n'est pas Papa" — clears suggestion, keeps as unknown.
  Future<bool> rejectSuggestion(String clusterId) async {
    _processingIds.add(clusterId);
    notifyListeners();

    final success = await rejectSuggestionApi(clusterId);

    _processingIds.remove(clusterId);

    if (success) {
      // Update persona in list to clear suggestion fields
      final idx = _personas.indexWhere((p) => p.id == clusterId);
      if (idx != -1) {
        final old = _personas[idx];
        _personas[idx] = VoicePersona(
          id: old.id,
          label: old.label,
          status: old.status,
          totalSegments: old.totalSegments,
          totalDurationSeconds: old.totalDurationSeconds,
          firstSeen: old.firstSeen,
          lastSeen: old.lastSeen,
          conversationCount: old.conversationCount,
          sampleQuotes: old.sampleQuotes,
          audioSampleUrl: old.audioSampleUrl,
          tags: old.tags,
          suggestionName: null,
          suggestionPersonId: null,
        );
      }
    }
    notifyListeners();
    return success;
  }
}
