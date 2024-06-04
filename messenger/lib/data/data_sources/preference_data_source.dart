import 'package:messenger/data/data_sources/interfaces/i_preference_data_source.dart';
import 'package:messenger/domain/entities/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceDataSource implements IPreferenceDataSource {
  SharedPreferences prefs;

  PreferenceDataSource(this.prefs);

  bool _isLightTheme = false;
  String _appLanguage = 'ru';
  Language _messageLanguage = Language.English;
  static const String _appLanguageKey = 'appLanguage';
  static const String _messageLanguageKey = 'messageLanguage';
  static const String _isLightThemeKey = 'isLightTheme';

  void init() {
    _isLightTheme = prefs.getBool(_isLightThemeKey) ?? false;
    _appLanguage = prefs.getString(_appLanguageKey) ?? 'ru';
    _messageLanguage = Language.values.firstWhere(
      (e) => e.name == prefs.getString(_messageLanguageKey),
      orElse: () => Language.English,
    );
  }

  @override
  bool get isLightTheme => _isLightTheme;

  @override
  String get appLanguage => _appLanguage;

  @override
  Language get messageLanguage => _messageLanguage;

  @override
  set isLightTheme(bool isLightTheme) {
    _isLightTheme = isLightTheme;
  }

  @override
  set appLanguage(String language) {
    _appLanguage = language;
    prefs.setString(_appLanguageKey, language);
  }

  @override
  set messageLanguage(Language language) {
    _messageLanguage = language;
    prefs.setString(_messageLanguageKey, language.name);
  }
}
