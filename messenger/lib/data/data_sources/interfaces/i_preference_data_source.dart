import 'package:messenger/domain/entities/language.dart';

abstract class IPreferenceDataSource {
  bool get isLightTheme;
  String get appLanguage;
  Language get messageLanguage;
  set isLightTheme(bool isLightTheme);
  set appLanguage(String language);
  set messageLanguage(Language language);
}