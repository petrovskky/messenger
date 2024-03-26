import 'package:messenger/data/data_sources/interfaces/i_preference_data_source.dart';

class PreferenceDataSource implements IPreferenceDataSource {
  bool _isLightTheme = false;
  String _language = 'ru';

  @override
  bool get isLightTheme => _isLightTheme;

  @override
  String get language => _language;

  @override
  set isLightTheme(bool isLightTheme) {
    _isLightTheme = isLightTheme;
  }

  @override
  set language(String language) {
    _language = language;
  }
}
