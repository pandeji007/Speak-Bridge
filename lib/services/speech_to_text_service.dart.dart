// lib/services/speech_to_text_service.dart
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextService {
  final stt.SpeechToText _speech = stt.SpeechToText();

  Future<void> initSpeech() async {
    await _speech.initialize();
  }

  Future<String> listen(String localeId) async {
    await _speech.listen(localeId: localeId);
    await Future.delayed(const Duration(seconds: 10));
    _speech.stop();
    return _speech.lastRecognizedWords;
  }
}
