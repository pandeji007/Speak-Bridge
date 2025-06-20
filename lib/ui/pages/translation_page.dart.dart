// lib/ui/translator_page.dart
import 'package:flutter/material.dart';
import 'package:speak_bridge/services/speech_to_text_service.dart.dart';
import 'package:speak_bridge/services/text_to_speech_service.dart.dart';
import 'package:speak_bridge/services/translation_service.dart.dart';
import 'package:speak_bridge/ui/widgets/translate_button.dart.dart';

class TranslatorPage extends StatefulWidget {
  final String sourceLanguage;
  final String targetLanguage;

  const TranslatorPage({
    super.key,
    required this.sourceLanguage,
    required this.targetLanguage,
  });

  @override
  State<TranslatorPage> createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {
  final SpeechToTextService _speechService = SpeechToTextService();
  final TextToSpeechService _ttsService = TextToSpeechService();
  final TranslationService _translationService = TranslationService();

  String _recognizedText = '';
  String _translatedText = '';

  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speechService.initSpeech();
    _ttsService.initTTS();
  }

  void _startListening() async {
    setState(() => _isListening = true);
    final result = await _speechService.listen(widget.sourceLanguage);
    setState(() {
      _recognizedText = result;
      _isListening = false;
    });
  }

  void _translateText() async {
    if (_recognizedText.isEmpty) return;
    final translated = await _translationService.translateText(
      _recognizedText,
      widget.sourceLanguage,
      widget.targetLanguage,
    );
    setState(() => _translatedText = translated);
  }

  void _speakTranslation() {
    if (_translatedText.isEmpty) return;
    _ttsService.speak(_translatedText, widget.targetLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Speak Bridge'), centerTitle: true),
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
              GestureDetector(
                onTap: _startListening,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _isListening ? 100 : 80,
                  height: _isListening ? 100 : 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    _isListening ? Icons.mic : Icons.mic_none,
                    size: 40,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              if (_recognizedText.isNotEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Recognized: $_recognizedText',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              if (_translatedText.isNotEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Translation: $_translatedText',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TranslateButton(
                    icon: Icons.translate,
                    onPressed: _translateText,
                    label: 'Translate',
                  ),
                  TranslateButton(
                    icon: Icons.volume_up,
                    onPressed: _speakTranslation,
                    label: 'Speak',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
