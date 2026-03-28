// TOKI — Mood entry and trend schemas

class TokiMoodEntry {
  final String id;
  final String mood;
  final String energy;
  final List<String> signals;
  final double confidence;
  final int score; // 1-5
  final DateTime createdAt;

  const TokiMoodEntry({
    required this.id,
    required this.mood,
    required this.energy,
    required this.signals,
    required this.confidence,
    required this.score,
    required this.createdAt,
  });

  factory TokiMoodEntry.fromJson(Map<String, dynamic> json) => TokiMoodEntry(
        id: json['id'] as String,
        mood: (json['mood'] as String?) ?? 'neutral',
        energy: (json['energy'] as String?) ?? 'medium',
        signals: (json['signals'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        confidence: ((json['confidence'] as num?) ?? 0).toDouble(),
        score: (json['score'] as int?) ?? 3,
        createdAt: DateTime.parse(json['created_at'] as String),
      );
}

class TokiMoodTrend {
  final String date; // YYYY-MM-DD
  final double avgScore;
  final String dominantMood;
  final int entryCount;

  const TokiMoodTrend({
    required this.date,
    required this.avgScore,
    required this.dominantMood,
    required this.entryCount,
  });

  factory TokiMoodTrend.fromJson(Map<String, dynamic> json) => TokiMoodTrend(
        date: json['date'] as String,
        avgScore: ((json['avg_score'] as num?) ?? 3).toDouble(),
        dominantMood: (json['dominant_mood'] as String?) ?? 'neutral',
        entryCount: (json['entry_count'] as int?) ?? 0,
      );
}

String moodEmoji(String mood) {
  switch (mood) {
    case 'great':
      return '🤩';
    case 'good':
      return '😊';
    case 'neutral':
      return '😐';
    case 'tired':
      return '😴';
    case 'stressed':
      return '😰';
    case 'anxious':
      return '😟';
    case 'sad':
      return '😢';
    case 'angry':
      return '😠';
    default:
      return '😐';
  }
}
