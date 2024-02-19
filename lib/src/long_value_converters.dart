import 'package:numbers_to_words/src/internal/container.dart';

import 'internal/long_to_string_converter.dart';

enum LongValueConverters {
  croatian,
  english,
  polish,
  hindi,
  swedish,
  japaneseKanji;

  String? asWords(int value) {
    return converter.asWords(value);
  }

  LongToStringConverter get converter {
    switch (this) {
      case croatian:
        return Container.croatianContainer().getLongConverter()!;
      case english:
        return Container.englishContainer().getLongConverter()!;
      case polish:
        return Container.polishContainer().getLongConverter()!;
      case hindi:
        return Container.hindiContainer().getLongConverter()!;
      case swedish:
        return Container.swedishContainer().getLongConverter()!;
      case japaneseKanji:
        return Container.japaneseKanjiContainer().getLongConverter()!;
    }
  }
}
