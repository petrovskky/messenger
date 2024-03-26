abstract class IPreferenceDataSource {
  bool get isLightTheme;
  String get language;
  set isLightTheme(bool isLightTheme);
  set language(String language);
}