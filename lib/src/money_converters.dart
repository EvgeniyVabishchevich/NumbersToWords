import 'package:numbers_to_words/src/internal/double_to_string_converter.dart';

import 'internal/container.dart';

enum MoneyConverters {
  brazilianPortuguese,
  english,
  americanEnglish,
  german,
  russian,
  polish,
  italian,
  croatian,
  czech,
  slovak,
  latvian,
  kazakh,
  ukrainian,
  turkish,
  serbian,
  serbianCyrillic,
  slovene,
  french,
  bulgarian,
  dutch,
  spanish,
  hindi,
  swedish,
  japanese;

  String? asWords(double value) {
    return converter.asWords(value);
  }

  String asWordsWithCurrencySymbol(double value, String currencySymbol) {
    return converter.asWordsWithSymbol(value, currencySymbol);
  }

  DoubleToStringConverter get converter {
    switch (this) {
      case brazilianPortuguese:
        return Container.brazilianPortugueseContainer()
            .getBankingMoneyConverter();
      case english:
        return Container.englishContainer().getBankingMoneyConverter();
      case americanEnglish:
        return Container.americanEnglishContainer().getBankingMoneyConverter();
      case german:
        return Container.germanContainer().getBankingMoneyConverter();
      case russian:
        return Container.russianContainer().getBankingMoneyConverter();
      case polish:
        return Container.polishContainer().getBankingMoneyConverter();
      case italian:
        return Container.italianContainer().getBankingMoneyConverter();
      case croatian:
        return Container.croatianContainer().getBankingMoneyConverter();
      case czech:
        return Container.czechContainer().getBankingMoneyConverter();
      case slovak:
        return Container.slovakContainer().getBankingMoneyConverter();
      case latvian:
        return Container.latvianContainer().getBankingMoneyConverter();
      case kazakh:
        return Container.kazakhContainer().getBankingMoneyConverter();
      case ukrainian:
        return Container.ukrainianContainer().getBankingMoneyConverter();
      case turkish:
        return Container.turkishContainer().getBankingMoneyConverter();
      case serbian:
        return Container.serbianContainer().getBankingMoneyConverter();
      case serbianCyrillic:
        return Container.serbianCyrillicContainer().getBankingMoneyConverter();
      case slovene:
        return Container.sloveneContainer().getBankingMoneyConverter();
      case french:
        return Container.frenchContainer().getBankingMoneyConverter();
      case bulgarian:
        return Container.bulgarianContainer().getBankingMoneyConverter();
      case dutch:
        return Container.dutchContainer().getBankingMoneyConverter();
      case spanish:
        return Container.spanishContainer().getBankingMoneyConverter();
      case hindi:
        return Container.hindiContainer().getBankingMoneyConverter();
      case swedish:
        return Container.swedishContainer().getBankingMoneyConverter();
      case japanese:
        return Container.japaneseKanjiContainer().getBankingMoneyConverter();
    }
  }
}
