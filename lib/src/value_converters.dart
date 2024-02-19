import 'internal/container.dart';
import 'internal/integer_to_string_converter.dart';
import 'internal/support/assert.dart';

enum ValueConverters {
  brazilianPortuguese(["pt", "pt-br"]),
  english(["en"]),
  german(["de"]),
  russian(["ru"]),
  italian(["it"]),
  polish(["pl"]),
  croatian(["hr"]),
  czech(["cs"]),
  slovak(["sk"]),
  latvian(["lv"]),
  kazakh(["kk"]),
  ukrainian(["uk"]),
  serbian(["sr", "sr__#Latn"]),
  serbianCyrillic(["sr__#Cyrl"]),
  bulgarian(["bg"]),
  french(["fr"]),
  turkish(["tr"]),
  dutch(["nl"]),
  slovene(["sl"]),
  spanish(["es"]),
  hindi(["hi"]),
  swedish(["sv"]),
  japanese(["ja"]);

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
      case brazilianPortuguese:
        return Container.brazilianPortugueseContainer().getIntegerConverter();
      case english:
        return Container.englishContainer().getIntegerConverter();
      case german:
        return Container.germanContainer().getIntegerConverter();
      case russian:
        return Container.russianContainer().getIntegerConverter();
      case italian:
        return Container.italianContainer().getIntegerConverter();
      case polish:
        return Container.polishContainer().getIntegerConverter();
      case croatian:
        return Container.croatianContainer().getIntegerConverter();
      case czech:
        return Container.czechContainer().getIntegerConverter();
      case slovak:
        return Container.slovakContainer().getIntegerConverter();
      case latvian:
        return Container.latvianContainer().getIntegerConverter();
      case kazakh:
        return Container.kazakhContainer().getIntegerConverter();
      case ukrainian:
        return Container.ukrainianContainer().getIntegerConverter();
      case serbian:
        return Container.serbianContainer().getIntegerConverter();
      case serbianCyrillic:
        return Container.serbianCyrillicContainer().getIntegerConverter();
      case bulgarian:
        return Container.bulgarianContainer().getIntegerConverter();
      case french:
        return Container.frenchContainer().getIntegerConverter();
      case turkish:
        return Container.turkishContainer().getIntegerConverter();
      case dutch:
        return Container.dutchContainer().getIntegerConverter();
      case slovene:
        return Container.sloveneContainer().getIntegerConverter();
      case spanish:
        return Container.spanishContainer().getIntegerConverter();
      case hindi:
        return Container.hindiContainer().getIntegerConverter();
      case swedish:
        return Container.swedishContainer().getIntegerConverter();
      case japanese:
        return Container.japaneseKanjiContainer().getIntegerConverter();
    }
  }
}
