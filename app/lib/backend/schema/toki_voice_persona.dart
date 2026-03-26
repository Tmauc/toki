// TOKI — Voice Persona Dart models
// Mirrors backend models/unknown_speakers.py

enum ClusterStatus { unknown, named, deleted }

enum PersonTag { famille, ami, collegue, connaissance, autre }

class SampleQuote {
  final String text;
  final String conversationId;
  final DateTime timestamp;

  const SampleQuote({
    required this.text,
    required this.conversationId,
    required this.timestamp,
  });

  factory SampleQuote.fromJson(Map<String, dynamic> json) => SampleQuote(
        text: json['text'] as String,
        conversationId: json['conversation_id'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
      );
}

class VoicePersona {
  final String id;
  final String label;
  final ClusterStatus status;
  final int totalSegments;
  final double totalDurationSeconds;
  final DateTime firstSeen;
  final DateTime lastSeen;
  final int conversationCount;
  final List<SampleQuote> sampleQuotes;
  final String? audioSampleUrl;
  final List<PersonTag> tags;
  final String? suggestionName;
  final String? suggestionPersonId;

  const VoicePersona({
    required this.id,
    required this.label,
    required this.status,
    required this.totalSegments,
    required this.totalDurationSeconds,
    required this.firstSeen,
    required this.lastSeen,
    required this.conversationCount,
    required this.sampleQuotes,
    this.audioSampleUrl,
    required this.tags,
    this.suggestionName,
    this.suggestionPersonId,
  });

  bool get hasSuggestion => suggestionName != null && suggestionName!.isNotEmpty;

  bool get isUnknown => status == ClusterStatus.unknown;
  bool get isNamed => status == ClusterStatus.named;

  String get durationLabel {
    final minutes = (totalDurationSeconds / 60).floor();
    if (minutes < 1) return '${totalDurationSeconds.toStringAsFixed(0)}s';
    return '${minutes}min';
  }

  factory VoicePersona.fromJson(Map<String, dynamic> json) {
    ClusterStatus status;
    switch (json['status'] as String) {
      case 'named':
        status = ClusterStatus.named;
        break;
      case 'deleted':
        status = ClusterStatus.deleted;
        break;
      default:
        status = ClusterStatus.unknown;
    }

    final tagsRaw = (json['tags'] as List<dynamic>?) ?? [];
    final tags = tagsRaw.map((t) {
      switch (t as String) {
        case 'famille':
          return PersonTag.famille;
        case 'ami':
          return PersonTag.ami;
        case 'collegue':
          return PersonTag.collegue;
        case 'connaissance':
          return PersonTag.connaissance;
        default:
          return PersonTag.autre;
      }
    }).toList();

    return VoicePersona(
      id: json['id'] as String,
      label: json['label'] as String,
      status: status,
      totalSegments: json['total_segments'] as int,
      totalDurationSeconds: (json['total_duration_seconds'] as num).toDouble(),
      firstSeen: DateTime.parse(json['first_seen'] as String),
      lastSeen: DateTime.parse(json['last_seen'] as String),
      conversationCount: json['conversation_count'] as int,
      sampleQuotes: ((json['sample_quotes'] as List<dynamic>?) ?? [])
          .map((q) => SampleQuote.fromJson(q as Map<String, dynamic>))
          .toList(),
      audioSampleUrl: json['audio_sample_url'] as String?,
      tags: tags,
      suggestionName: json['suggestion_name'] as String?,
      suggestionPersonId: json['suggestion_person_id'] as String?,
    );
  }
}
