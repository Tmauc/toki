// TOKI — Voice Personas HTTP API client
// Maps to backend routers/toki_voice_personas.py

import 'dart:convert';

import 'package:omi/backend/http/shared.dart';
import 'package:omi/backend/schema/toki_voice_persona.dart';
import 'package:omi/env/env.dart';
import 'package:omi/utils/logger.dart';

const _base = 'v1/toki/voice-personas';

/// Fetch all unknown (or named) voice persona clusters.
Future<List<VoicePersona>> getVoicePersonas({String status = 'unknown'}) async {
  final response = await makeApiCall(
    url: '${Env.apiBaseUrl}$_base/?status=$status&limit=100',
    headers: {},
    method: 'GET',
    body: '',
  );
  if (response == null || response.statusCode != 200) return [];
  try {
    final decoded = json.decode(response.body) as List<dynamic>;
    return decoded
        .map((e) => VoicePersona.fromJson(e as Map<String, dynamic>))
        .toList();
  } catch (e) {
    Logger.error('getVoicePersonas parse error: $e');
    return [];
  }
}

/// Name a voice persona cluster.
/// Returns the updated [VoicePersona] on success, null on failure.
Future<VoicePersona?> nameVoicePersona(
  String clusterId,
  String name, {
  String? personId,
  List<PersonTag> tags = const [],
}) async {
  final tagStrings = tags.map((t) => t.name).toList();
  final body = json.encode({
    'name': name,
    if (personId != null) 'person_id': personId,
    'tags': tagStrings,
  });

  final response = await makeApiCall(
    url: '${Env.apiBaseUrl}$_base/$clusterId/name',
    headers: {},
    method: 'POST',
    body: body,
  );
  if (response == null || response.statusCode != 200) {
    Logger.error('nameVoicePersona failed: ${response?.statusCode}');
    return null;
  }
  try {
    return VoicePersona.fromJson(
        json.decode(response.body) as Map<String, dynamic>);
  } catch (e) {
    Logger.error('nameVoicePersona parse error: $e');
    return null;
  }
}

/// Soft-delete a voice persona cluster.
Future<bool> deleteVoicePersona(String clusterId) async {
  final response = await makeApiCall(
    url: '${Env.apiBaseUrl}$_base/$clusterId',
    headers: {},
    method: 'DELETE',
    body: '',
  );
  return response?.statusCode == 200;
}

/// Merge two clusters. [keepId] must be one of the two IDs.
Future<VoicePersona?> mergeVoicePersonas(
    String clusterId, String otherId, String keepId) async {
  final response = await makeApiCall(
    url: '${Env.apiBaseUrl}$_base/$clusterId/merge/$otherId',
    headers: {},
    method: 'POST',
    body: json.encode({'keep_id': keepId}),
  );
  if (response == null || response.statusCode != 200) return null;
  try {
    return VoicePersona.fromJson(
        json.decode(response.body) as Map<String, dynamic>);
  } catch (e) {
    Logger.error('mergeVoicePersonas parse error: $e');
    return null;
  }
}

/// Find the cluster that contains a given (conversationId, speakerLabel) pair.
/// Returns null if not found or on error.
Future<VoicePersona?> lookupClusterForSegment(
    String conversationId, String speakerLabel) async {
  final uri = Uri.encodeFull(
      '${Env.apiBaseUrl}$_base/lookup?conversation_id=$conversationId&speaker_id=$speakerLabel');
  final response = await makeApiCall(
    url: uri,
    headers: {},
    method: 'GET',
    body: '',
  );
  if (response == null || response.statusCode == 404) return null;
  if (response.statusCode != 200) return null;
  try {
    return VoicePersona.fromJson(
        json.decode(response.body) as Map<String, dynamic>);
  } catch (e) {
    Logger.error('lookupClusterForSegment parse error: $e');
    return null;
  }
}

/// Confirm the auto-suggestion ("Yes, this is Papa").
/// Returns the updated [VoicePersona] (now named) on success, null on failure.
Future<VoicePersona?> confirmSuggestionApi(String clusterId) async {
  final response = await makeApiCall(
    url: '${Env.apiBaseUrl}$_base/$clusterId/confirm-suggestion',
    headers: {},
    method: 'POST',
    body: '',
  );
  if (response == null || response.statusCode != 200) {
    Logger.error('confirmSuggestion failed: ${response?.statusCode}');
    return null;
  }
  try {
    return VoicePersona.fromJson(
        json.decode(response.body) as Map<String, dynamic>);
  } catch (e) {
    Logger.error('confirmSuggestion parse error: $e');
    return null;
  }
}

/// Reject the auto-suggestion ("No, this is not Papa").
Future<bool> rejectSuggestionApi(String clusterId) async {
  final response = await makeApiCall(
    url: '${Env.apiBaseUrl}$_base/$clusterId/reject-suggestion',
    headers: {},
    method: 'POST',
    body: '',
  );
  return response?.statusCode == 200;
}

/// Fetch per-conversation summaries for the split UI.
Future<List<Map<String, dynamic>>> getClusterConversations(String clusterId) async {
  final response = await makeApiCall(
    url: '${Env.apiBaseUrl}$_base/$clusterId/conversations',
    headers: {},
    method: 'GET',
    body: '',
  );
  if (response == null || response.statusCode != 200) return [];
  try {
    return (json.decode(response.body) as List<dynamic>)
        .cast<Map<String, dynamic>>();
  } catch (e) {
    Logger.error('getClusterConversations parse error: $e');
    return [];
  }
}

/// Split a cluster: move [conversationIds] into a brand-new cluster.
/// Returns the new [VoicePersona] on success, null on failure.
Future<VoicePersona?> splitVoicePersona(
    String clusterId, List<String> conversationIds) async {
  final body = json.encode({'conversation_ids': conversationIds});
  final response = await makeApiCall(
    url: '${Env.apiBaseUrl}$_base/$clusterId/split',
    headers: {},
    method: 'POST',
    body: body,
  );
  if (response == null || response.statusCode != 200) {
    Logger.error('splitVoicePersona failed: ${response?.statusCode}');
    return null;
  }
  try {
    return VoicePersona.fromJson(
        json.decode(response.body) as Map<String, dynamic>);
  } catch (e) {
    Logger.error('splitVoicePersona parse error: $e');
    return null;
  }
}

/// Get the signed audio sample URL for a cluster.
Future<String?> getAudioSampleUrl(String clusterId) async {
  final response = await makeApiCall(
    url: '${Env.apiBaseUrl}$_base/$clusterId/audio',
    headers: {},
    method: 'GET',
    body: '',
  );
  if (response == null || response.statusCode != 200) return null;
  try {
    final decoded = json.decode(response.body) as Map<String, dynamic>;
    return decoded['audio_sample_url'] as String?;
  } catch (e) {
    return null;
  }
}
