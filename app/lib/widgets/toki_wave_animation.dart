import 'package:flutter/material.dart';

/// Animated wave + notes banner extracted from plans_sheet.dart
/// Can be used as a decorative header in any page.
class TokiWaveAnimation extends StatefulWidget {
  final double height;
  const TokiWaveAnimation({super.key, this.height = 120});

  @override
  State<TokiWaveAnimation> createState() => _TokiWaveAnimationState();
}

class _TokiWaveAnimationState extends State<TokiWaveAnimation> with TickerProviderStateMixin {
  late AnimationController _waveController;
  late AnimationController _notesController;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(vsync: this, duration: const Duration(seconds: 8))..repeat();
    _notesController = AnimationController(vsync: this, duration: const Duration(seconds: 12))..repeat();
  }

  @override
  void dispose() {
    _waveController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: Row(
        children: [
          // Left side: scrolling waveform bars
          Expanded(
            child: ClipRect(
              child: AnimatedBuilder(
                animation: _waveController,
                builder: (context, child) {
                  const double totalWidth = 420.0;
                  final scrollOffset = (_waveController.value * totalWidth) % totalWidth;
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: -totalWidth + scrollOffset,
                        top: 0,
                        bottom: 0,
                        child: Row(
                          children: List.generate(60, (index) {
                            final heights = [
                              20.0,
                              32.0,
                              45.0,
                              26.0,
                              52.0,
                              39.0,
                              32.0,
                              45.0,
                              28.0,
                              36.0,
                              41.0,
                              24.0,
                              48.0,
                              37.0,
                              30.0,
                              43.0,
                              22.0,
                              34.0,
                              47.0,
                              29.0,
                              50.0,
                              38.0,
                              33.0,
                              44.0,
                            ];
                            return Container(
                              width: 4,
                              height: heights[index % heights.length],
                              margin: const EdgeInsets.symmetric(horizontal: 1.5),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            );
                          }),
                        ),
                      ),
                      Positioned(
                        left: scrollOffset,
                        top: 0,
                        bottom: 0,
                        child: Row(
                          children: List.generate(60, (index) {
                            final heights = [20.0, 32.0, 45.0, 26.0, 52.0, 39.0, 32.0, 45.0];
                            return Container(
                              width: 4,
                              height: heights[index % heights.length],
                              margin: const EdgeInsets.symmetric(horizontal: 1.5),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          // Right side: scrolling note cards
          Expanded(
            child: ClipRect(
              child: AnimatedBuilder(
                animation: _notesController,
                builder: (context, child) {
                  const double totalWidth = 440.0;
                  final scrollOffset = (_notesController.value * totalWidth) % totalWidth;
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: -totalWidth + scrollOffset,
                        top: 0,
                        bottom: 0,
                        child: Row(children: List.generate(8, (index) => _buildNoteCard())),
                      ),
                      Positioned(
                        left: scrollOffset,
                        top: 0,
                        bottom: 0,
                        child: Row(children: List.generate(8, (index) => _buildNoteCard())),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteCard() {
    return Container(
      width: 45,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 26,
              height: 3,
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(1.5)),
            ),
            const SizedBox(height: 4),
            ...List.generate(
              5,
              (i) => Container(
                width: i == 4 ? 24 : 35,
                height: 2,
                margin: const EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
