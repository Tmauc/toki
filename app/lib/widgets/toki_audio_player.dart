// TOKI — Audio sample player for voice persona clusters.
// Fetches the signed GCS URL on first tap, plays via just_audio.

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:omi/backend/http/api/toki_voice_personas.dart';

enum _AudioState { idle, loading, playing, error }

/// Small circular play/stop button that streams a voice cluster's 5-second sample.
class TokiAudioPlayer extends StatefulWidget {
  final String clusterId;

  /// Button diameter. Defaults to 36.
  final double size;

  const TokiAudioPlayer({super.key, required this.clusterId, this.size = 36});

  @override
  State<TokiAudioPlayer> createState() => _TokiAudioPlayerState();
}

class _TokiAudioPlayerState extends State<TokiAudioPlayer> {
  _AudioState _state = _AudioState.idle;
  AudioPlayer? _player;

  @override
  void dispose() {
    _player?.stop();
    _player?.dispose();
    super.dispose();
  }

  Future<void> _toggle() async {
    if (_state == _AudioState.playing) {
      await _player?.stop();
      if (mounted) setState(() => _state = _AudioState.idle);
      return;
    }

    if (_state == _AudioState.loading) return;

    if (mounted) setState(() => _state = _AudioState.loading);

    final url = await getAudioSampleUrl(widget.clusterId);
    if (!mounted) return;

    if (url == null) {
      setState(() => _state = _AudioState.error);
      return;
    }

    _player ??= AudioPlayer();
    try {
      await _player!.setUrl(url);
      if (!mounted) return;
      setState(() => _state = _AudioState.playing);
      await _player!.play();
      if (mounted) setState(() => _state = _AudioState.idle);
    } catch (_) {
      if (mounted) setState(() => _state = _AudioState.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double sz = widget.size;
    return GestureDetector(
      onTap: _state == _AudioState.error ? () => setState(() => _state = _AudioState.idle) : _toggle,
      child: Container(
        width: sz,
        height: sz,
        decoration: BoxDecoration(
          color: _state == _AudioState.playing
              ? Colors.white.withOpacity(0.2)
              : const Color(0xFF2C2C2E),
          shape: BoxShape.circle,
          border: Border.all(
            color: _state == _AudioState.playing ? Colors.white54 : Colors.white12,
            width: 1,
          ),
        ),
        child: _buildIcon(sz),
      ),
    );
  }

  Widget _buildIcon(double sz) {
    final iconSize = sz * 0.44;
    switch (_state) {
      case _AudioState.loading:
        return Padding(
          padding: EdgeInsets.all(sz * 0.28),
          child: const CircularProgressIndicator(strokeWidth: 1.5, color: Colors.white54),
        );
      case _AudioState.playing:
        return Icon(Icons.stop_rounded, size: iconSize, color: Colors.white);
      case _AudioState.error:
        return Icon(Icons.error_outline_rounded, size: iconSize, color: Colors.redAccent);
      case _AudioState.idle:
        return Icon(Icons.play_arrow_rounded, size: iconSize, color: Colors.white54);
    }
  }
}
