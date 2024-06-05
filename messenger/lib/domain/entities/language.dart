import 'package:messenger/data/utils/translator.dart';

enum Language {
  Arabic,
  Armenian,
  Azerbaijani,
  Belarusian,
  ChineseSimplified,
  ChineseTraditional,
  Czech,
  Danish,
  Dutch,
  English,
  Estonian,
  Finnish,
  French,
  Georgian,
  German,
  Greek,
  Hungarian,
  Italian,
  Japanese,
  Kannada,
  Kazakh,
  Korean,
  Latvian,
  Lithuanian,
  Norwegian,
  Polish,
  Russian,
  Serbian,
  Slovak,
  Slovenian,
  Somali,
  Spanish,
  Swedish,
  Tatar,
  Thai,
  Turkish,
  Ukrainian
}

extension on Language {
  String get code => Translator.supportedLanguages.entries.firstWhere((e) => e.key == name).value;
}
