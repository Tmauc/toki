// TOKI — "Voix non identifiées" screen
// Lists all unknown voice persona clusters in a grid.
// The user can tap a card to name it or swipe/tap X to delete it.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:omi/backend/schema/toki_voice_persona.dart';
import 'package:omi/providers/toki_voice_personas_provider.dart';
import 'package:omi/widgets/voice_persona_card.dart';
import 'name_persona_page.dart';

class VoicePersonasPage extends StatefulWidget {
  const VoicePersonasPage({super.key});

  @override
  State<VoicePersonasPage> createState() => _VoicePersonasPageState();
}

class _VoicePersonasPageState extends State<VoicePersonasPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VoicePersonasProvider>().loadPersonas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Voix non identifiées',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded, color: Colors.white70),
            onPressed: () =>
                context.read<VoicePersonasProvider>().loadPersonas(refresh: true),
          ),
        ],
      ),
      body: Consumer<VoicePersonasProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white54),
            );
          }

          if (provider.state == VoicePersonasLoadState.error) {
            return _ErrorState(
              message: provider.errorMessage ?? 'Erreur inconnue',
              onRetry: () => provider.loadPersonas(refresh: true),
            );
          }

          if (provider.personas.isEmpty) {
            return const _EmptyState();
          }

          return RefreshIndicator(
            color: Colors.white,
            backgroundColor: const Color(0xFF1C1C1E),
            onRefresh: () => provider.loadPersonas(refresh: true),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemCount: provider.personas.length,
                itemBuilder: (context, index) {
                  final persona = provider.personas[index];
                  return VoicePersonaCard(
                    persona: persona,
                    isProcessing: provider.isProcessing(persona.id),
                    onTap: () => _openNamingPage(context, persona),
                    onDelete: () => _confirmDelete(context, provider, persona),
                    onConfirmSuggestion: () => _confirmSuggestion(context, provider, persona),
                    onRejectSuggestion: () => provider.rejectSuggestion(persona.id),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _openNamingPage(BuildContext context, VoicePersona persona) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider.value(
          value: context.read<VoicePersonasProvider>(),
          child: NamePersonaPage(persona: persona),
        ),
      ),
    );
  }

  void _confirmSuggestion(
      BuildContext context, VoicePersonasProvider provider, VoicePersona persona) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1C1C1E),
        title: Text('C\'est ${persona.suggestionName} ?',
            style: const TextStyle(color: Colors.white)),
        content: Text(
          'Cette voix sera identifiée comme ${persona.suggestionName} et toutes les conversations passées seront mises à jour.',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Annuler',
                style: TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              provider.confirmSuggestion(persona.id);
            },
            child: Text('Oui, c\'est ${persona.suggestionName}',
                style: const TextStyle(color: Colors.indigoAccent)),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(
      BuildContext context, VoicePersonasProvider provider, VoicePersona persona) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1C1C1E),
        title: const Text('Supprimer cette voix ?',
            style: TextStyle(color: Colors.white)),
        content: Text(
          '${persona.label} sera retiré de ta liste. Cette action est irréversible.',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Annuler',
                style: TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              provider.deletePersona(persona.id);
            },
            child: const Text('Supprimer',
                style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }
}

// ── Empty state ───────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.record_voice_over_rounded,
              size: 64, color: Colors.white24),
          SizedBox(height: 16),
          Text(
            'Aucune voix inconnue',
            style: TextStyle(color: Colors.white70, fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),
          Text(
            'Les voix détectées dans tes\nconversations apparaîtront ici.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white38, fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }
}

// ── Error state ───────────────────────────────────────────────

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline_rounded,
              size: 48, color: Colors.redAccent),
          const SizedBox(height: 12),
          const Text('Impossible de charger les voix',
              style: TextStyle(color: Colors.white70, fontSize: 16)),
          const SizedBox(height: 6),
          Text(message,
              style: const TextStyle(color: Colors.white38, fontSize: 12)),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: onRetry,
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white24)),
            child: const Text('Réessayer',
                style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}
