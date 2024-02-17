import 'internal/container.dart';
import 'internal/integer_to_string_converter.dart';
import 'internal/support/assert.dart';

enum ValueConverters {
  BRAZILIAN_PORTUGUESE_INTEGER(["pt", "pt-br"]),
  ENGLISH_INTEGER(["en"]),
  GERMAN_INTEGER(["de"]),
  RUSSIAN_INTEGER(["ru"]),
  ITALIAN_INTEGER(["it"]),
  POLISH_INTEGER(["pl"]),
  CROATIAN_INTEGER(["hr"]),
  CZECH_INTEGER(["cs"]),
  SLOVAK_INTEGER(["sk"]),
  LATVIAN_INTEGER(["lv"]),
  KAZAKH_INTEGER(["kk"]),
  UKRAINIAN_INTEGER(["uk"]),
  SERBIAN_INTEGER(["sr", "sr__#Latn"]),
  SERBIAN_CYRILLIC_INTEGER(["sr__#Cyrl"]),
  BULGARIAN_INTEGER(["bg"]),
  FRENCH_INTEGER(["fr"]),
  TURKISH_INTEGER(["tr"]),
  DUTCH_INTEGER(["nl"]),
  SLOVENE_INTEGER(["sl"]),
  SPANISH_INTEGER(["es"]),
  HINDI_INTEGER(["hi"]),
  SWEDISH_INTEGER(["sv"]),
  JAPANESE_INTEGER(["ja"]);

  final List<String> languageCodes;

  const ValueConverters(this.languageCodes);

  static ValueConverters getByLanguageCodeOrDefault(
      String languageCode, ValueConverters defaultConverter) {
    //Objects.requireNonNull(languageCode);
    Assert.isFalse(languageCode.isEmpty);

    return ValueConverters.values.firstWhere(
        (element) => element.languageCodes.contains(languageCode),
        orElse: () => defaultConverter);
  }

  String? asWords(int value) {
    return converter.asWords(value);
  }

  IntegerToStringConverter get converter {
    switch (this) {
      case BRAZILIAN_PORTUGUESE_INTEGER:
        return Container.brazilianPortugueseContainer().getIntegerConverter();
      case ENGLISH_INTEGER:
        return Container.englishContainer().getIntegerConverter();
      case GERMAN_INTEGER:
        return Container.germanContainer().getIntegerConverter();
      case RUSSIAN_INTEGER:
        return Container.russianContainer().getIntegerConverter();
      case ITALIAN_INTEGER:
        return Container.italianContainer().getIntegerConverter();
      case POLISH_INTEGER:
        return Container.polishContainer().getIntegerConverter();
      case CROATIAN_INTEGER:
        return Container.croatianContainer().getIntegerConverter();
      case CZECH_INTEGER:
        return Container.czechContainer().getIntegerConverter();
      case SLOVAK_INTEGER:
        return Container.slovakContainer().getIntegerConverter();
      case LATVIAN_INTEGER:
        return Container.latvianContainer().getIntegerConverter();
      case KAZAKH_INTEGER:
        return Container.kazakhContainer().getIntegerConverter();
      case UKRAINIAN_INTEGER:
        return Container.ukrainianContainer().getIntegerConverter();
      case SERBIAN_INTEGER:
        return Container.serbianContainer().getIntegerConverter();
      case SERBIAN_CYRILLIC_INTEGER:
        return Container.serbianCyrillicContainer().getIntegerConverter();
      case BULGARIAN_INTEGER:
        return Container.bulgarianContainer().getIntegerConverter();
      case FRENCH_INTEGER:
        return Container.frenchContainer().getIntegerConverter();
      case TURKISH_INTEGER:
        return Container.turkishContainer().getIntegerConverter();
      case DUTCH_INTEGER:
        return Container.dutchContainer().getIntegerConverter();
      case SLOVENE_INTEGER:
        return Container.sloveneContainer().getIntegerConverter();
      case SPANISH_INTEGER:
        return Container.spanishContainer().getIntegerConverter();
      case HINDI_INTEGER:
        return Container.hindiContainer().getIntegerConverter();
      case SWEDISH_INTEGER:
        return Container.swedishContainer().getIntegerConverter();
      case JAPANESE_INTEGER:
        return Container.japaneseKanjiContainer().getIntegerConverter();
    }
  }
}
