// TOKI — Voice Persona Card widget
// Displays a single unknown-speaker cluster in the grid/list.

import 'package:flutter/material.dart';

import 'package:omi/backend/schema/toki_voice_persona.dart';
import 'package:omi/widgets/toki_audio_player.dart';

class VoicePersonaCard extends StatelessWidget {
  final VoicePersona persona;
  final bool isProcessing;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback? onConfirmSuggestion;
  final VoidCallback? onRejectSuggestion;

  const VoicePersonaCard({
    super.key,
    required this.persona,
    required this.isProcessing,
    required this.onTap,
    required this.onDelete,
    this.onConfirmSuggestion,
    this.onRejectSuggestion,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isProcessing ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF2C2C2E),
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Avatar(label: persona.label),
                      if (!isProcessing)
                        Padding(
                          padding: const EdgeInsets.only(right: 28),
                          child: TokiAudioPlayer(clusterId: persona.id, size: 32),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    persona.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  _StatsRow(persona: persona),
                  if (persona.sampleQuotes.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _QuotePreview(quote: persona.sampleQuotes.first.text),
                  ],
                  if (persona.hasSuggestion) ...[
                    const SizedBox(height: 8),
                    _SuggestionBanner(
                      name: persona.suggestionName!,
                      onConfirm: isProcessing ? null : onConfirmSuggestion,
                      onReject: isProcessing ? null : onRejectSuggestion,
                    ),
                  ],
                ],
              ),
            ),
            // Delete button (top-right)
            Positioned(
              top: 6,
              right: 6,
              child: GestureDetector(
                onTap: isProcessing ? null : onDelete,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2C2C2E),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    size: 14,
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
            // Processing overlay
            if (isProcessing)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ── Avatar ────────────────────────────────────────────────────

class _Avatar extends StatelessWidget {
  final String label;
  const _Avatar({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4A4A6A), Color(0xFF2A2A4A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Icon(
        Icons.record_voice_over_rounded,
        color: Colors.white70,
        size: 22,
      ),
    );
  }
}

// ── Stats row ─────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  final VoicePersona persona;
  const _StatsRow({required this.persona});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Stat(
          icon: Icons.chat_bubble_outline_rounded,
          value: '${persona.conversationCount}',
        ),
        const SizedBox(width: 10),
        _Stat(
          icon: Icons.timer_outlined,
          value: persona.durationLabel,
        ),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  final IconData icon;
  final String value;
  const _Stat({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 11, color: Colors.white38),
        const SizedBox(width: 3),
        Text(value,
            style: const TextStyle(color: Colors.white38, fontSize: 11)),
      ],
    );
  }
}

// ── Quote preview ─────────────────────────────────────────────

class _QuotePreview extends StatelessWidget {
  final String quote;
  const _QuotePreview({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '"$quote"',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 11,
          fontStyle: FontStyle.italic,
          height: 1.3,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

// ── Suggestion banner ─────────────────────────────────────────

class _SuggestionBanner extends StatelessWidget {
  final String name;
  final VoidCallback? onConfirm;
  final VoidCallback? onReject;
  const _SuggestionBanner({
    required this.name,
    this.onConfirm,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.indigo.withOpacity(0.18),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.indigo.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'C\'est $name ?',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onConfirm,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.indigo.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Oui',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: GestureDetector(
                  onTap: onReject,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Non',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
