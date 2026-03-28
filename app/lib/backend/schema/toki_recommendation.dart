// TOKI — Recommendation schema

class TokiRecommendation {
  final String id;
  final String text;
  final String category;
  final String? recommender;
  final String? sourceQuote;
  final String conversationId;
  final bool done;
  final DateTime createdAt;

  const TokiRecommendation({
    required this.id,
    required this.text,
    required this.category,
    this.recommender,
    this.sourceQuote,
    required this.conversationId,
    required this.done,
    required this.createdAt,
  });

  factory TokiRecommendation.fromJson(Map<String, dynamic> json) => TokiRecommendation(
        id: json['id'] as String,
        text: json['text'] as String,
        category: (json['category'] as String?) ?? 'autre',
        recommender: json['recommender'] as String?,
        sourceQuote: json['source_quote'] as String?,
        conversationId: json['conversation_id'] as String,
        done: (json['done'] as bool?) ?? false,
        createdAt: DateTime.parse(json['created_at'] as String),
      );

  String get categoryEmoji {
    switch (category) {
      case 'film':
        return '🎬';
      case 'série':
        return '📺';
      case 'livre':
        return '📚';
      case 'musique':
        return '🎵';
      case 'restaurant':
        return '🍽️';
      case 'podcast':
        return '🎙️';
      case 'appli':
        return '📱';
      default:
        return '✨';
    }
  }
}
