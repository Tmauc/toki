// TOKI — Mood API client

import 'dart:convert';

import 'package:omi/backend/http/shared.dart';
import 'package:omi/backend/schema/toki_mood_entry.dart';
import 'package:omi/env/env.dart';
import 'package:omi/utils/logger.dart';

/// Fetch mood trends aggregated by day for the last [days] days.
Future<List<TokiMoodTrend>> getMoodTrends({int days = 30}) async {
  final response = await makeApiCall(
    url: '${Env.apiBaseUrl}v1/toki/mood/trends?days=$days',
    headers: {},
    method: 'GET',
    body: '',
  );
  if (response == null || response.statusCode != 200) return [];
  try {
    final decoded = json.decode(response.body) as List<dynamic>;
    return decoded
        .map((e) => TokiMoodTrend.fromJson(e as Map<String, dynamic>))
        .toList();
  } catch (e) {
    Logger.error('getMoodTrends parse error: $e');
    return [];
  }
}
