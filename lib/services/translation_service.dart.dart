// lib/services/translation_service.dart
import 'package:translator/translator.dart';

class TranslationService {
  final translator = GoogleTranslator();

  Future<String> translateText(
    String text,
    String fromLang,
    String toLang,
  ) async {
    final translation = await translator.translate(
      text,
      from: fromLang,
      to: toLang,
    );
    return translation.text;
  }
}
