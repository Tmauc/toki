// TOKI — Split cluster page.
// Lets the user select which conversations to move into a new unknown cluster
// when two different voices were merged into one.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:omi/backend/http/api/toki_voice_personas.dart';
import 'package:omi/backend/schema/toki_voice_persona.dart';
import 'package:omi/providers/toki_voice_personas_provider.dart';

class SplitPersonaPage extends StatefulWidget {
  final VoicePersona persona;
  const SplitPersonaPage({super.key, required this.persona});

  @override
  State<SplitPersonaPage> createState() => _SplitPersonaPageState();
}

class _SplitPersonaPageState extends State<SplitPersonaPage> {
  bool _isLoading = true;
  bool _isSaving = false;
  List<Map<String, dynamic>> _conversations = [];
  final Set<String> _selectedIds = {};

  @override
  void initState() {
    super.initState();
    _loadConversations();
  }

  Future<void> _loadConversations() async {
    final convs = await getClusterConversations(widget.persona.id);
    if (mounted) {
      setState(() {
        _conversations = convs;
        _isLoading = false;
      });
    }
  }

  Future<void> _split() async {
    if (_selectedIds.isEmpty) return;
    if (_selectedIds.length == _conversations.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Garde au moins une conversation dans ce cluster.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    setState(() => _isSaving = true);

    final newPersona = await context
        .read<VoicePersonasProvider>()
        .splitPersona(widget.persona.id, _selectedIds.toList());

    if (!mounted) return;
    setState(() => _isSaving = false);

    if (newPersona != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${_selectedIds.length} conversation${_selectedIds.length > 1 ? 's' : ''} déplacées dans un nouveau cluster.',
          ),
          backgroundColor: Colors.green.shade700,
          duration: const Duration(seconds: 3),
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erreur lors du split. Réessaie.'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Séparer "${widget.persona.label}"',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Instruction banner
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deux voix différentes dans ce cluster ?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Sélectionne les conversations qui appartiennent à l\'autre personne — elles seront déplacées dans un nouveau cluster.',
                    style: const TextStyle(color: Colors.white54, fontSize: 13, height: 1.4),
                  ),
                ],
              ),
            ),

            // Conversation list
            Expanded(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white54))
                  : _conversations.isEmpty
                      ? const Center(
                          child: Text('Aucune conversation trouvée.',
                              style: TextStyle(color: Colors.white38)))
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _conversations.length,
                          itemBuilder: (context, index) {
                            final conv = _conversations[index];
                            final convId = conv['conversation_id'] as String;
                            final quotes =
                                (conv['quotes'] as List<dynamic>? ?? [])
                                    .cast<String>();
                            final isSelected = _selectedIds.contains(convId);
                            return _ConversationTile(
                              conversationId: convId,
                              quotes: quotes,
                              isSelected: isSelected,
                              onToggle: () {
                                setState(() {
                                  if (isSelected) {
                                    _selectedIds.remove(convId);
                                  } else {
                                    _selectedIds.add(convId);
                                  }
                                });
                              },
                            );
                          },
                        ),
            ),

            // Bottom action bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (_selectedIds.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '${_selectedIds.length} conversation${_selectedIds.length > 1 ? 's' : ''} sélectionnée${_selectedIds.length > 1 ? 's' : ''}',
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 13),
                      ),
                    ),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed:
                          (_selectedIds.isEmpty || _isSaving) ? null : _split,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        disabledBackgroundColor: Colors.white24,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      child: _isSaving
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.black54),
                            )
                          : const Text(
                              'Créer un nouveau cluster',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Conversation tile ──────────────────────────────────────────

class _ConversationTile extends StatelessWidget {
  final String conversationId;
  final List<String> quotes;
  final bool isSelected;
  final VoidCallback onToggle;

  const _ConversationTile({
    required this.conversationId,
    required this.quotes,
    required this.isSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.1)
              : const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.white38 : Colors.white12,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkbox
            Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(top: 1, right: 12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.white : Colors.transparent,
                border: Border.all(
                  color: isSelected ? Colors.white : Colors.white38,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check_rounded,
                      size: 12, color: Colors.black)
                  : null,
            ),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Conv. …${conversationId.length > 8 ? conversationId.substring(conversationId.length - 8) : conversationId}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontFamily: 'monospace',
                    ),
                  ),
                  if (quotes.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    ...quotes.map((q) => Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            '"$q"',
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                  ] else
                    const Text(
                      'Pas de citation disponible',
                      style: TextStyle(color: Colors.white24, fontSize: 12),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
