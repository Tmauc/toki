// TOKI — Naming flow for an unknown voice persona.
// The user types a name, selects relationship tags, and confirms.
// Triggers the retroactive update on the backend (background task).

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:omi/backend/schema/toki_voice_persona.dart';
import 'package:omi/pages/toki/split_persona_page.dart';
import 'package:omi/providers/toki_voice_personas_provider.dart';
import 'package:omi/widgets/toki_audio_player.dart';

class NamePersonaPage extends StatefulWidget {
  final VoicePersona persona;
  const NamePersonaPage({super.key, required this.persona});

  @override
  State<NamePersonaPage> createState() => _NamePersonaPageState();
}

class _NamePersonaPageState extends State<NamePersonaPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final Set<PersonTag> _selectedTags = {};
  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);

    final success = await context.read<VoicePersonasProvider>().namePersona(
          widget.persona.id,
          _nameController.text.trim(),
          tags: _selectedTags.toList(),
        );

    if (!mounted) return;
    setState(() => _isSaving = false);

    if (success) {
      _showSuccessBanner();
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible de sauvegarder. Réessaie.'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  void _showSuccessBanner() {
    final name = _nameController.text.trim();
    final convCount = widget.persona.conversationCount;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$name identifié dans $convCount conversation${convCount > 1 ? 's' : ''}',
        ),
        backgroundColor: Colors.green.shade700,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Identifier cette voix',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PersonaHeader(persona: widget.persona),
              const SizedBox(height: 28),
              _SectionLabel('Prénom ou surnom'),
              const SizedBox(height: 8),
              _NameField(
                  formKey: _formKey, controller: _nameController),
              const SizedBox(height: 24),
              _SectionLabel('Relation (optionnel)'),
              const SizedBox(height: 10),
              _TagSelector(
                selected: _selectedTags,
                onToggle: (tag) {
                  setState(() {
                    if (_selectedTags.contains(tag)) {
                      _selectedTags.remove(tag);
                    } else {
                      _selectedTags.add(tag);
                    }
                  });
                },
              ),
              if (widget.persona.sampleQuotes.isNotEmpty) ...[
                const SizedBox(height: 28),
                _SectionLabel('Phrases de cette voix'),
                const SizedBox(height: 10),
                _QuotesList(quotes: widget.persona.sampleQuotes),
              ],
              const SizedBox(height: 36),
              _SaveButton(isSaving: _isSaving, onPressed: _save),
              if (widget.persona.conversationCount > 1) ...[
                const SizedBox(height: 12),
                Center(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ChangeNotifierProvider.value(
                            value: context.read<VoicePersonasProvider>(),
                            child: SplitPersonaPage(persona: widget.persona),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.call_split_rounded,
                        size: 16, color: Colors.white38),
                    label: const Text(
                      'Deux voix différentes dans ce cluster ?',
                      style: TextStyle(color: Colors.white38, fontSize: 13),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ── Persona header ────────────────────────────────────────────

class _PersonaHeader extends StatelessWidget {
  final VoicePersona persona;
  const _PersonaHeader({required this.persona});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF4A4A6A), Color(0xFF2A2A4A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          child: const Icon(Icons.record_voice_over_rounded,
              color: Colors.white70, size: 26),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      persona.label,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  TokiAudioPlayer(clusterId: persona.id),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${persona.conversationCount} conversation${persona.conversationCount > 1 ? 's' : ''} · ${persona.durationLabel} enregistré',
                style: const TextStyle(color: Colors.white54, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Section label ─────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        color: Colors.white38,
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    );
  }
}

// ── Name field ────────────────────────────────────────────────

class _NameField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  const _NameField({required this.formKey, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        style: const TextStyle(color: Colors.white, fontSize: 17),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: 'ex. Papa, Marie, Alex…',
          hintStyle: const TextStyle(color: Colors.white30),
          filled: true,
          fillColor: const Color(0xFF1C1C1E),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white24, width: 1.5),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        validator: (val) {
          if (val == null || val.trim().isEmpty) return 'Entrez un prénom';
          if (val.trim().length > 60) return 'Maximum 60 caractères';
          return null;
        },
      ),
    );
  }
}

// ── Tag selector ──────────────────────────────────────────────

class _TagSelector extends StatelessWidget {
  final Set<PersonTag> selected;
  final void Function(PersonTag) onToggle;
  const _TagSelector({required this.selected, required this.onToggle});

  static const _labels = {
    PersonTag.famille: 'Famille',
    PersonTag.ami: 'Ami·e',
    PersonTag.collegue: 'Collègue',
    PersonTag.connaissance: 'Connaissance',
    PersonTag.autre: 'Autre',
  };

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: PersonTag.values.map((tag) {
        final isSelected = selected.contains(tag);
        return GestureDetector(
          onTap: () => onToggle(tag),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.white.withOpacity(0.15)
                  : const Color(0xFF1C1C1E),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? Colors.white54 : Colors.white12,
              ),
            ),
            child: Text(
              _labels[tag] ?? tag.name,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white54,
                fontSize: 13,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ── Quotes list ───────────────────────────────────────────────

class _QuotesList extends StatelessWidget {
  final List<SampleQuote> quotes;
  const _QuotesList({required this.quotes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: quotes
          .take(3)
          .map(
            (q) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '"${q.text}"',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

// ── Save button ───────────────────────────────────────────────

class _SaveButton extends StatelessWidget {
  final bool isSaving;
  final VoidCallback onPressed;
  const _SaveButton({required this.isSaving, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isSaving ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          disabledBackgroundColor: Colors.white24,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        child: isSaving
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: Colors.black54),
              )
            : const Text(
                'Identifier cette voix',
                style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
      ),
    );
  }
}
