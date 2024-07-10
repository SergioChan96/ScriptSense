abstract class ITranslationService {
  Future<String> translate(String sourceLanguage, String targetLanguage, String text);
}