import 'package:untitled1/src/tradukisto/internal/container.dart';

import 'internal/long_to_string_converter.dart';

enum LongValueConverters {
  CROATIAN_LONG,
  ENGLISH_LONG,
  POLISH_LONG,
  HINDI_LONG,
  SWEDISH_LONG,
  JAPANESE_KANJI_LONG;

  String? asWords(int value) {
    return converter.asWords(value);
  }

  LongToStringConverter get converter {
    switch (this) {
      case CROATIAN_LONG:
        return Container.croatianContainer().getLongConverter()!;
      case ENGLISH_LONG:
        return Container.englishContainer().getLongConverter()!;
      case POLISH_LONG:
        return Container.polishContainer().getLongConverter()!;
      case HINDI_LONG:
        return Container.hindiContainer().getLongConverter()!;
      case SWEDISH_LONG:
        return Container.swedishContainer().getLongConverter()!;
      case JAPANESE_KANJI_LONG:
        return Container.japaneseKanjiContainer().getLongConverter()!;
    }
  }
}
