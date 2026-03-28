// TOKI — Recommendations Provider

import 'package:flutter/foundation.dart';

import 'package:omi/backend/http/api/toki_recommendations.dart';
import 'package:omi/backend/schema/toki_recommendation.dart';

class TokiRecommendationsProvider extends ChangeNotifier {
  List<TokiRecommendation> _recommendations = [];
  bool _isLoading = false;
  String? _selectedCategory;

  List<TokiRecommendation> get recommendations =>
      List.unmodifiable(_recommendations);
  bool get isLoading => _isLoading;
  String? get selectedCategory => _selectedCategory;

  // ── Fetch ──────────────────────────────────────────────────

  Future<void> fetch() async {
    _isLoading = true;
    notifyListeners();

    final result = await getRecommendations(category: _selectedCategory);
    _recommendations = result;
    _isLoading = false;
    notifyListeners();
  }

  // ── Mark Done ─────────────────────────────────────────────

  Future<void> markDone(String id) async {
    // Optimistic: remove immediately
    _recommendations.removeWhere((r) => r.id == id);
    notifyListeners();

    await markRecommendationDone(id);
  }

  // ── Delete ────────────────────────────────────────────────

  Future<void> delete(String id) async {
    // Optimistic: remove immediately
    _recommendations.removeWhere((r) => r.id == id);
    notifyListeners();

    await deleteRecommendation(id);
  }

  // ── Filter ────────────────────────────────────────────────

  Future<void> filterByCategory(String? cat) async {
    _selectedCategory = cat;
    await fetch();
  }
}
