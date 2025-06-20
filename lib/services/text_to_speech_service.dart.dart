// lib/services/text_to_speech_service.dart
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechService {
  final FlutterTts _tts = FlutterTts();

  Future<void> initTTS() async {
    await _tts.setLanguage('en-US');
    await _tts.setPitch(1.0);
  }

  Future<void> speak(String text, String languageCode) async {
    await _tts.setLanguage(languageCode);
    await _tts.speak(text);
  }
}
