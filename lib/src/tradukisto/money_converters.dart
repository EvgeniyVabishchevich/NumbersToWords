import 'package:untitled1/src/tradukisto/internal/double_to_string_converter.dart';

import 'internal/container.dart';

enum MoneyConverters {
  BRAZILIAN_PORTUGUESE_BANKING_MONEY_VALUE,
  ENGLISH_BANKING_MONEY_VALUE,
  AMERICAN_ENGLISH_BANKING_MONEY_VALUE,
  GERMAN_BANKING_MONEY_VALUE,
  RUSSIAN_BANKING_MONEY_VALUE,
  POLISH_BANKING_MONEY_VALUE,
  ITALIAN_BANKING_MONEY_VALUE,
  CROATIAN_BANKING_MONEY_VALUE,
  CZECH_BANKING_MONEY_VALUE,
  SLOVAK_BANKING_MONEY_VALUE,
  LATVIAN_BANKING_MONEY_VALUE,
  KAZAKH_BANKING_MONEY_VALUE,
  UKRAINIAN_BANKING_MONEY_VALUE,
  TURKISH_BANKING_MONEY_VALUE,
  SERBIAN_BANKING_MONEY_VALUE,
  SERBIAN_CYRILLIC_BANKING_MONEY_VALUE,
  SLOVENE_BANKING_MONEY_VALUE,
  FRENCH_BANKING_MONEY_VALUE,
  BULGARIAN_BANKING_MONEY_VALUE,
  DUTCH_BANKING_MONEY_VALUE,
  SPANISH_BANKING_MONEY_VALUE,
  HINDI_BANKING_MONEY_VALUE,
  SWEDISH_BANKING_MONEY_VALUE,
  JAPANESE_BANKING_MONEY_VALUE;

  String? asWords(double value) {
    return converter.asWords(value);
  }

  String asWordsWithCurrencySymbol(double value, String currencySymbol) {
    return converter.asWordsWithSymbol(value, currencySymbol);
  }

  DoubleToStringConverter get converter {
    switch (this) {
      case BRAZILIAN_PORTUGUESE_BANKING_MONEY_VALUE:
        return Container.brazilianPortugueseContainer()
            .getBankingMoneyConverter();
      case ENGLISH_BANKING_MONEY_VALUE:
        return Container.englishContainer().getBankingMoneyConverter();
      case AMERICAN_ENGLISH_BANKING_MONEY_VALUE:
        return Container.americanEnglishContainer().getBankingMoneyConverter();
      case GERMAN_BANKING_MONEY_VALUE:
        return Container.germanContainer().getBankingMoneyConverter();
      case RUSSIAN_BANKING_MONEY_VALUE:
        return Container.russianContainer().getBankingMoneyConverter();
      case POLISH_BANKING_MONEY_VALUE:
        return Container.polishContainer().getBankingMoneyConverter();
      case ITALIAN_BANKING_MONEY_VALUE:
        return Container.italianContainer().getBankingMoneyConverter();
      case CROATIAN_BANKING_MONEY_VALUE:
        return Container.croatianContainer().getBankingMoneyConverter();
      case CZECH_BANKING_MONEY_VALUE:
        return Container.czechContainer().getBankingMoneyConverter();
      case SLOVAK_BANKING_MONEY_VALUE:
        return Container.slovakContainer().getBankingMoneyConverter();
      case LATVIAN_BANKING_MONEY_VALUE:
        return Container.latvianContainer().getBankingMoneyConverter();
      case KAZAKH_BANKING_MONEY_VALUE:
        return Container.kazakhContainer().getBankingMoneyConverter();
      case UKRAINIAN_BANKING_MONEY_VALUE:
        return Container.ukrainianContainer().getBankingMoneyConverter();
      case TURKISH_BANKING_MONEY_VALUE:
        return Container.turkishContainer().getBankingMoneyConverter();
      case SERBIAN_BANKING_MONEY_VALUE:
        return Container.serbianContainer().getBankingMoneyConverter();
      case SERBIAN_CYRILLIC_BANKING_MONEY_VALUE:
        return Container.serbianCyrillicContainer().getBankingMoneyConverter();
      case SLOVENE_BANKING_MONEY_VALUE:
        return Container.sloveneContainer().getBankingMoneyConverter();
      case FRENCH_BANKING_MONEY_VALUE:
        return Container.frenchContainer().getBankingMoneyConverter();
      case BULGARIAN_BANKING_MONEY_VALUE:
        return Container.bulgarianContainer().getBankingMoneyConverter();
      case DUTCH_BANKING_MONEY_VALUE:
        return Container.dutchContainer().getBankingMoneyConverter();
      case SPANISH_BANKING_MONEY_VALUE:
        return Container.spanishContainer().getBankingMoneyConverter();
      case HINDI_BANKING_MONEY_VALUE:
        return Container.hindiContainer().getBankingMoneyConverter();
      case SWEDISH_BANKING_MONEY_VALUE:
        return Container.swedishContainer().getBankingMoneyConverter();
      case JAPANESE_BANKING_MONEY_VALUE:
        return Container.japaneseKanjiContainer().getBankingMoneyConverter();
    }
  }
}
