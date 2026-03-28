// TOKI — Recommendations HTTP API client
// Maps to backend routers/toki_recommendations.py

import 'dart:convert';

import 'package:omi/backend/http/shared.dart';
import 'package:omi/backend/schema/toki_recommendation.dart';
import 'package:omi/env/env.dart';
import 'package:omi/utils/logger.dart';

const _base = 'v1/toki/recommendations';

/// Fetch recommendations, optionally filtered by [category].
/// Pass [includeDone] = true to include already-done recommendations.
Future<List<TokiRecommendation>> getRecommendations({
  String? category,
  bool includeDone = false,
}) async {
  final params = <String, String>{};
  if (category != null) params['category'] = category;
  if (includeDone) params['include_done'] = 'true';

  final queryString =
      params.isNotEmpty ? '?${params.entries.map((e) => '${e.key}=${Uri.encodeComponent(e.value)}').join('&')}' : '';

  final response = await makeApiCall(
    url: '${Env.apiBaseUrl}$_base$queryString',
    headers: {},
    method: 'GET',
    body: '',
  );
  if (response == null || response.statusCode != 200) return [];
  try {
    final decoded = json.decode(response.body) as List<dynamic>;
    return decoded
        .map((e) => TokiRecommendation.fromJson(e as Map<String, dynamic>))
        .toList();
  } catch (e) {
    Logger.error('getRecommendations parse error: $e');
    return [];
  }
}

/// Mark a recommendation as done.
Future<bool> markRecommendationDone(String id) async {
  final response = await makeApiCall(
    url: '${Env.apiBaseUrl}$_base/$id/done',
    headers: {},
    method: 'POST',
    body: '',
  );
  return response?.statusCode == 200;
}

/// Delete a recommendation.
Future<bool> deleteRecommendation(String id) async {
  final response = await makeApiCall(
    url: '${Env.apiBaseUrl}$_base/$id',
    headers: {},
    method: 'DELETE',
    body: '',
  );
  return response?.statusCode == 200;
}
