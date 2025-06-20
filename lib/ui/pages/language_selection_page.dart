// lib/ui/language_selection_page.dart
import 'package:flutter/material.dart';
import 'package:speak_bridge/ui/pages/translation_page.dart.dart';
import 'package:speak_bridge/ui/widgets/language_selector.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String _sourceLanguage = 'en';
  String _targetLanguage = 'es';

  void _proceed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => TranslatorPage(
              sourceLanguage: _sourceLanguage,
              targetLanguage: _targetLanguage,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Languages'), centerTitle: true),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurpleAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              LanguageSelector(
                label: 'From',
                selectedLanguage: _sourceLanguage,
                onChanged: (value) => setState(() => _sourceLanguage = value),
              ),
              const SizedBox(height: 20),
              LanguageSelector(
                label: 'To',
                selectedLanguage: _targetLanguage,
                onChanged: (value) => setState(() => _targetLanguage = value),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _proceed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Continue', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
