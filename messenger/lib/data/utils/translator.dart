import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:messenger/domain/entities/language.dart';

class Translator {
  static Future<String> translate(String message, Language target) async {
    try {
      final url = Uri.parse('https://translate-plus.p.rapidapi.com/translate');
      final body = jsonEncode({
        'text': message,
        'source': 'auto',
        'target': supportedLanguages.entries
            .firstWhere((e) => e.key == target.name)
            .value,
      });

      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'x-rapidapi-ua': 'RapidAPI-Playground',
          'x-rapidapi-key':
              '45187f901amsh6f0709b3adc1a84p14da17jsnd75099fdda7f',
          'x-rapidapi-host': 'translate-plus.p.rapidapi.com',
          'specificMethodHeaders': '[object Object]',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
        return jsonResponse['translations']['translation'];
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return message;
  }

  static Map<String, String> supportedLanguages = {
    'Arabic': 'ar',
    'Armenian': 'hy',
    'Azerbaijani': 'az',
    'Belarusian': 'be',
    'ChineseSimplified': 'zh-CN',
    'ChineseTraditional': 'zh-TW',
    'Czech': 'cs',
    'Danish': 'da',
    'Dutch': 'nl',
    'English': 'en',
    'Estonian': 'et',
    'Finnish': 'fi',
    'French': 'fr',
    'Georgian': 'ka',
    'German': 'de',
    'Greek': 'el',
    'Hungarian': 'hu',
    'Italian': 'it',
    'Japanese': 'ja',
    'Kannada': 'kn',
    'Kazakh': 'kk',
    'Korean': 'ko',
    'Latvian': 'lv',
    'Lithuanian': 'lt',
    'Norwegian': 'no',
    'Polish': 'pl',
    'Russian': 'ru',
    'Serbian': 'sr',
    'Slovak': 'sk',
    'Slovenian': 'sl',
    'Somali': 'so',
    'Spanish': 'es',
    'Swedish': 'sv',
    'Tatar': 'tt',
    'Thai': 'th',
    'Turkish': 'tr',
    'Ukrainian': 'uk'
  };
}
