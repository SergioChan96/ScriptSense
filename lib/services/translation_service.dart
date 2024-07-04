import 'package:http/http.dart' as http;
import 'dart:convert';

class TranslationService {
  final String apiUrl = 'https://translation.googleapis.com/language/translate/v2';
  final String apiKey = 'AIzaSyBwHk4DhNOWFMyKVNaCG-iEFOOIBf08Jhw';

  Future<String> translate(String sourceLanguage, String targetLanguage, String text) async {
    final response = await http.post(
      Uri.parse('$apiUrl?key=$apiKey'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'q': text,
        'source': sourceLanguage,
        'target': targetLanguage,
        'format': 'text',
      }),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print("translation: ${body['data']['translations'][0]['translatedText']} ");
      return body['data']['translations'][0]['translatedText'] as String;
    } else {
      print('HTTP status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to translate text.');
    }
  }
}