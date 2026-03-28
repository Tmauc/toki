// TOKI — Recommendations page

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:omi/backend/schema/toki_recommendation.dart';
import 'package:omi/providers/toki_recommendations_provider.dart';

class RecommendationsPage extends StatelessWidget {
  const RecommendationsPage({super.key});

  static const _categories = [
    (label: 'Tout', value: null),
    (label: '🎬 Films', value: 'film'),
    (label: '📺 Séries', value: 'série'),
    (label: '📚 Livres', value: 'livre'),
    (label: '🎵 Musique', value: 'musique'),
    (label: '🍽️ Restos', value: 'restaurant'),
    (label: '🎙️ Podcasts', value: 'podcast'),
    (label: '📱 Applis', value: 'appli'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Recommandations',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded, color: Colors.white70),
            onPressed: () => context.read<TokiRecommendationsProvider>().fetch(),
          ),
        ],
      ),
      body: Consumer<TokiRecommendationsProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              _CategoryFilterRow(
                categories: _categories,
                selected: provider.selectedCategory,
                onSelect: (cat) =>
                    provider.filterByCategory(cat),
              ),
              const Divider(height: 1, color: Color(0xFF2C2C2E)),
              Expanded(
                child: provider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: Colors.white54),
                      )
                    : provider.recommendations.isEmpty
                        ? const _EmptyState()
                        : _RecommendationList(
                            recommendations: provider.recommendations,
                            onMarkDone: (id) => provider.markDone(id),
                            onDelete: (id) => provider.delete(id),
                          ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ── Category filter chips ──────────────────────────────────

typedef _Category = ({String label, String? value});

class _CategoryFilterRow extends StatelessWidget {
  final List<_Category> categories;
  final String? selected;
  final ValueChanged<String?> onSelect;

  const _CategoryFilterRow({
    required this.categories,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final cat = categories[i];
          final isSelected = cat.value == selected;
          return GestureDetector(
            onTap: () => onSelect(cat.value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.deepPurple
                    : const Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                cat.label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white70,
                  fontSize: 13,
                  fontWeight: isSelected
                      ? FontWeight.w600
                      : FontWeight.w400,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ── Recommendation list ────────────────────────────────────

class _RecommendationList extends StatelessWidget {
  final List<TokiRecommendation> recommendations;
  final ValueChanged<String> onMarkDone;
  final ValueChanged<String> onDelete;

  const _RecommendationList({
    required this.recommendations,
    required this.onMarkDone,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: recommendations.length,
      separatorBuilder: (_, __) =>
          const Divider(height: 1, color: Color(0xFF2C2C2E), indent: 72),
      itemBuilder: (context, index) {
        final rec = recommendations[index];
        return Dismissible(
          key: ValueKey(rec.id),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            color: Colors.red.shade900,
            child: const Icon(Icons.delete_outline_rounded,
                color: Colors.white70),
          ),
          onDismissed: (_) => onDelete(rec.id),
          child: _RecommendationCard(
            recommendation: rec,
            onMarkDone: () => onMarkDone(rec.id),
            onDelete: () => onDelete(rec.id),
          ),
        );
      },
    );
  }
}

// ── Single card ────────────────────────────────────────────

class _RecommendationCard extends StatelessWidget {
  final TokiRecommendation recommendation;
  final VoidCallback onMarkDone;
  final VoidCallback onDelete;

  const _RecommendationCard({
    required this.recommendation,
    required this.onMarkDone,
    required this.onDelete,
  });

  Color _categoryColor(String category) {
    switch (category) {
      case 'film':
        return const Color(0xFF5E4B8B);
      case 'série':
        return const Color(0xFF1E5F74);
      case 'livre':
        return const Color(0xFF4A6741);
      case 'musique':
        return const Color(0xFF7A3B69);
      case 'restaurant':
        return const Color(0xFF7A4527);
      case 'podcast':
        return const Color(0xFF2B5278);
      case 'appli':
        return const Color(0xFF3D5A80);
      default:
        return const Color(0xFF4A4A4A);
    }
  }

  @override
  Widget build(BuildContext context) {
    final rec = recommendation;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category emoji circle
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: _categoryColor(rec.category),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(rec.categoryEmoji,
                style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rec.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
                if (rec.recommender != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Recommandé par ${rec.recommender}',
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                    ),
                  ),
                ],
                if (rec.sourceQuote != null &&
                    rec.sourceQuote!.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    '"${rec.sourceQuote}"',
                    style: const TextStyle(
                      color: Color(0xFF8E8E93),
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      height: 1.4,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Actions
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ActionButton(
                icon: Icons.check_circle_outline_rounded,
                color: Colors.green.shade400,
                onTap: onMarkDone,
                tooltip: 'Marquer comme fait',
              ),
              const SizedBox(height: 4),
              _ActionButton(
                icon: Icons.delete_outline_rounded,
                color: Colors.red.shade400,
                onTap: onDelete,
                tooltip: 'Supprimer',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final String tooltip;

  const _ActionButton({
    required this.icon,
    required this.color,
    required this.onTap,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Icon(icon, color: color, size: 22),
        ),
      ),
    );
  }
}

// ── Empty state ────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.bookmark_outline_rounded,
                size: 64, color: Colors.white24),
            SizedBox(height: 16),
            Text(
              'Aucune recommandation pour l\'instant.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Les recommandations de tes conversations apparaîtront ici.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white38,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
