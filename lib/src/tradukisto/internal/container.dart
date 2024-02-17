import 'base_values.dart';
import 'converters/double_to_banking_money_converter.dart';
import 'converters/hundreds_to_words_converter.dart';
import 'converters/number_to_words_converter.dart';
import 'double_to_string_converter.dart';
import 'integer_to_string_converter.dart';
import 'languages/bulgarian/bulgarian_integer_to_words_converter.dart';
import 'languages/bulgarian/bulgarian_values.dart';
import 'languages/croatian/croatian_values.dart';
import 'languages/czech/czech_integer_to_words_converter.dart';
import 'languages/czech/czech_values.dart';
import 'languages/czech/czech_values_for_small_numbers.dart';
import 'languages/dutch/dutch_integer_to_words_converter.dart';
import 'languages/dutch/dutch_thousand_to_words_converter.dart';
import 'languages/dutch/dutch_values.dart';
import 'languages/english/american_english_values.dart';
import 'languages/english/english_values.dart';
import 'languages/french/french_number_to_words_converter.dart';
import 'languages/french/french_values.dart';
import 'languages/german/german_integer_to_words_converter.dart';
import 'languages/german/german_thousand_to_words_converter.dart';
import 'languages/german/german_values.dart';
import 'languages/hindi/hindi_big_decimal_to_banking_money_converter.dart';
import 'languages/hindi/hindi_values.dart';
import 'languages/hindi/indian_number_to_words_converter.dart';
import 'languages/italian/italian_integer_to_words_converter.dart';
import 'languages/italian/italian_thousand_to_words_converter.dart';
import 'languages/italian/italian_values.dart';
import 'languages/japanese/japanese_number_to_words_converter.dart';
import 'languages/japanese/japanese_thousand_to_words_converter.dart';
import 'languages/japanese/japanese_values.dart';
import 'languages/kazakh/kazakh_values.dart';
import 'languages/latvian/latvian_values.dart';
import 'languages/polish/polish_values.dart';
import 'languages/portuguese/brazilian_portuguese_values.dart';
import 'languages/portuguese/portuguese_integer_to_words_converter.dart';
import 'languages/portuguese/portuguese_number_to_words_converter_adapter.dart';
import 'languages/portuguese/portuguese_thousand_to_words_converter.dart';
import 'languages/russian/russian_values.dart';
import 'languages/serbian/serbian_cyrillic_values.dart';
import 'languages/serbian/serbian_values.dart';
import 'languages/slovak/slovak_values.dart';
import 'languages/slovak/slovak_values_for_small_numbers.dart';
import 'languages/slovene/slovene_thousand_to_words_converter.dart';
import 'languages/slovene/slovene_values.dart';
import 'languages/spanish/spanish_integer_to_words_converter.dart';
import 'languages/spanish/spanish_integer_to_words_converter_adapter.dart';
import 'languages/spanish/spanish_thousand_to_words_converter.dart';
import 'languages/spanish/spanish_values.dart';
import 'languages/swedish/swedish_hundred_to_words_converter.dart';
import 'languages/swedish/swedish_values.dart';
import 'languages/turkish/turkish_double_to_banking_money_converter.dart';
import 'languages/turkish/turkish_integer_to_words_converter.dart';
import 'languages/turkish/turkish_small_numbers_to_words_converter.dart';
import 'languages/turkish/turkish_values.dart';
import 'languages/ukrainian/ukrainian_values.dart';
import 'long_to_string_converter.dart';

final class Container {
  static Container polishContainer() {
    return Container(PolishValues());
  }

  static Container russianContainer() {
    return Container(RussianValues());
  }

  static Container serbianContainer() {
    return Container(SerbianValues());
  }

  static Container serbianCyrillicContainer() {
    return Container(SerbianCyrillicValues());
  }

  static Container bulgarianContainer() {
    BulgarianValues bulgarianValues = BulgarianValues();

    HundredsToWordsConverter hundredsToStringConverter =
        HundredsToWordsConverter(bulgarianValues.baseNumbers(),
            bulgarianValues.twoDigitsNumberSeparator());

    IntegerToStringConverter integerToStringConverter =
        BulgarianintToWordsConverter(
            hundredsToStringConverter,
            bulgarianValues.pluralForms(),
            bulgarianValues.oneThousandException());

    DoubleToStringConverter doubleConverter = DoubleToBankingMoneyConverter(
        integerToStringConverter, bulgarianValues.currency());

    return Container.withConverter(
        integerToStringConverter, null, doubleConverter);
  }

  static Container ukrainianContainer() {
    return Container(UkrainianValues());
  }

  static Container croatianContainer() {
    return Container(CroatianValues());
  }

  static Container sloveneContainer() {
    SloveneValues values = SloveneValues();

    SloveneThousandToWordsConverter sloveneThousandToWordsConverter =
        SloveneThousandToWordsConverter(values.baseNumbers());

    IntegerToStringConverter converter = NumberToWordsConverter(
        sloveneThousandToWordsConverter, values.pluralForms());

    DoubleToStringConverter doubleBankingMoneyValueConverter =
        DoubleToBankingMoneyConverter(converter, values.currency());

    return Container.withConverter(
        converter, null, doubleBankingMoneyValueConverter);
  }

  static Container czechContainer() {
    CzechValues czechValues = CzechValues();
    Container containerForBigNumbers = Container(czechValues);
    Container containerForSmallNumbers =
        Container(CzechValuesForSmallNumbers());

    IntegerToStringConverter intConverter = CzechIntegerToWordsConverter(
        containerForBigNumbers.getIntegerConverter(),
        containerForSmallNumbers.getIntegerConverter(),
        czechValues.exceptions());
    DoubleToStringConverter doubleBankingMoneyValueConverter =
        DoubleToBankingMoneyConverter(intConverter, czechValues.currency());

    return Container.withConverter(
        intConverter, null, doubleBankingMoneyValueConverter);
  }

  static Container slovakContainer() {
    SlovakValues slovakValues = SlovakValues();
    Container containerForBigNumbers = Container(slovakValues);
    Container containerForSmallNumbers =
        Container(SlovakValuesForSmallNumbers());

    IntegerToStringConverter intConverter = CzechIntegerToWordsConverter(
        containerForBigNumbers.getIntegerConverter(),
        containerForSmallNumbers.getIntegerConverter(),
        slovakValues.exceptions());
    DoubleToStringConverter doubleBankingMoneyValueConverter =
        DoubleToBankingMoneyConverter(intConverter, slovakValues.currency());

    return Container.withConverter(
        intConverter, null, doubleBankingMoneyValueConverter);
  }

  static Container englishContainer() {
    return Container(EnglishValues());
  }

  static Container americanEnglishContainer() {
    return Container(AmericanEnglishValues());
  }

  static Container frenchContainer() {
    FrenchValues values = FrenchValues();

    HundredsToWordsConverter hundredsToWordsConverter =
        HundredsToWordsConverter(
            values.baseNumbers(), values.twoDigitsNumberSeparator());
    NumberToWordsConverter frenchNumberToWordsConverter =
        NumberToWordsConverter(hundredsToWordsConverter, values.pluralForms());
    IntegerToStringConverter converter = FrenchNumberToWordsConverter(
        frenchNumberToWordsConverter,
        values.exceptions(),
        values.pluralForms());

    DoubleToStringConverter doubleBankingMoneyValueConverter =
        DoubleToBankingMoneyConverter(converter, values.currency());

    return Container.withConverter(
        converter, null, doubleBankingMoneyValueConverter);
  }

  static Container germanContainer() {
    GermanValues values = GermanValues();

    GermanThousandToWordsConverter germanThousandToWordsConverter =
        GermanThousandToWordsConverter(values.baseNumbers());

    IntegerToStringConverter converter = GermanIntegerToWordsConverter(
        NumberToWordsConverter(
            germanThousandToWordsConverter, values.pluralForms()),
        values.exceptions(),
        germanThousandToWordsConverter);

    DoubleToStringConverter doubleBankingMoneyValueConverter =
        DoubleToBankingMoneyConverter(converter, values.currency());

    return Container.withConverter(
        converter, null, doubleBankingMoneyValueConverter);
  }

  static Container dutchContainer() {
    DutchValues values = DutchValues();

    DutchThousandToWordsConverter dutchThousandToWordsConverter =
        DutchThousandToWordsConverter(values.baseNumbers());

    IntegerToStringConverter converter = DutchIntegerToWordsConverter(
        NumberToWordsConverter(
            dutchThousandToWordsConverter, values.pluralForms()),
        values.exceptions(),
        dutchThousandToWordsConverter);

    DoubleToStringConverter doubleBankingMoneyValueConverter =
        DoubleToBankingMoneyConverter(converter, values.currency());

    return Container.withConverter(
        converter, null, doubleBankingMoneyValueConverter);
  }

  static Container italianContainer() {
    ItalianValues values = ItalianValues();

    ItalianThousandToWordsConverter italianThousandToWordsConverter =
        ItalianThousandToWordsConverter(values.baseNumbers());

    IntegerToStringConverter converter = ItalianIntegerToWordsConverter(
        NumberToWordsConverter(
            italianThousandToWordsConverter, values.pluralForms()),
        values.exceptions(),
        italianThousandToWordsConverter);

    DoubleToStringConverter doubleBankingMoneyValueConverter =
        DoubleToBankingMoneyConverter(converter, values.currency());

    return Container.withConverter(
        converter, null, doubleBankingMoneyValueConverter);
  }

  static Container latvianContainer() {
    return Container(LatvianValues());
  }

  static Container brazilianPortugueseContainer() {
    BrazilianPortugueseValues values = BrazilianPortugueseValues();

    PortugueseThousandToWordsConverter portugueseThousandToWordsConverter =
        PortugueseThousandToWordsConverter(
            values.baseNumbers(), values.exceptions());

    IntegerToStringConverter converter = PortugueseIntegerToWordsConverter(
        PortugueseNumberToWordsConverterAdapter(
            portugueseThousandToWordsConverter, values.pluralForms()),
        values.exceptions(),
        portugueseThousandToWordsConverter);

    DoubleToStringConverter doubleBankingMoneyValueConverter =
        DoubleToBankingMoneyConverter(converter, values.currency());

    return Container.withConverter(
        converter, null, doubleBankingMoneyValueConverter);
  }

  static Container turkishContainer() {
    TurkishValues values = TurkishValues();

    TurkishSmallNumbersToWordsConverter smallNumbersConverter =
        TurkishSmallNumbersToWordsConverter(values);
    NumberToWordsConverter bigNumbersConverter =
        NumberToWordsConverter(smallNumbersConverter, values.pluralForms());
    IntegerToStringConverter converter =
        TurkishintToWordsConverter(bigNumbersConverter, smallNumbersConverter);
    DoubleToStringConverter doubleBankingMoneyValueConverter =
        TurkishDoubleToBankingMoneyConverter(converter, values);

    return Container.withConverter(
        converter, null, doubleBankingMoneyValueConverter);
  }

  static Container kazakhContainer() {
    KazakhValues kazakhValues = KazakhValues();
    return Container(kazakhValues);
  }

  static Container hindiContainer() {
    HindiValues hindiValues = HindiValues();

    HundredsToWordsConverter hundredsToStringConverter =
        HundredsToWordsConverter(
            hindiValues.baseNumbers(), hindiValues.twoDigitsNumberSeparator());

    IntegerToStringConverter integerToStringConverter =
        IndianNumberToWordsConverter(
            hundredsToStringConverter, hindiValues.pluralForms());

    DoubleToStringConverter doubleConverter =
        HindidoubleToBankingMoneyConverter(
            integerToStringConverter, hindiValues);

    LongToStringConverter longValueConverters = IndianNumberToWordsConverter(
        hundredsToStringConverter, hindiValues.pluralForms());

    return Container.withConverter(
        integerToStringConverter, longValueConverters, doubleConverter);
  }

  static Container spanishContainer() {
    SpanishValues values = SpanishValues();

    SpanishThousandToWordsConverter spanishThousandToWordsConverter =
        SpanishThousandToWordsConverter(
            values.baseNumbers(), values.exceptions());

    IntegerToStringConverter converter = SpanishIntegerToWordsConverter(
        SpanishIntegerToWordsConverterAdapter(
            spanishThousandToWordsConverter, values.pluralForms()),
        values.exceptions(),
        spanishThousandToWordsConverter);

    DoubleToStringConverter doubleBankingMoneyValueConverter =
        DoubleToBankingMoneyConverter(converter, values.currency());

    return Container.withConverter(
        converter, null, doubleBankingMoneyValueConverter);
  }

  static Container swedishContainer() {
    SwedishValues swedishBaseValues = SwedishValues();

    SwedishHundredToWordsConverter swedishHundredsToStringConverter =
        SwedishHundredToWordsConverter(swedishBaseValues.baseNumbers());

    NumberToWordsConverter swedishNumberToWordsConverter =
        NumberToWordsConverter(
            swedishHundredsToStringConverter, swedishBaseValues.pluralForms());

    DoubleToStringConverter swedishDoubleConverter =
        DoubleToBankingMoneyConverter(
            swedishNumberToWordsConverter, swedishBaseValues.currency());

    return Container.withConverter(swedishNumberToWordsConverter,
        swedishNumberToWordsConverter, swedishDoubleConverter);
  }

  static Container japaneseKanjiContainer() {
    JapaneseValues japaneseValues = JapaneseValues();

    JapaneseThousandToWordsConverter japaneseThousandToWordsConverter =
        JapaneseThousandToWordsConverter(japaneseValues.baseNumbers());

    IntegerToStringConverter integerToStringConverter =
        JapaneseNumberToWordsConverter(
            japaneseThousandToWordsConverter, japaneseValues.pluralForms());

    LongToStringConverter longToStringConverter =
        JapaneseNumberToWordsConverter(
            japaneseThousandToWordsConverter, japaneseValues.pluralForms());

    DoubleToBankingMoneyConverter doubleToBankingMoneyConverter =
        DoubleToBankingMoneyConverter(
            integerToStringConverter, japaneseValues.currency());

    return Container.withConverter(integerToStringConverter,
        longToStringConverter, doubleToBankingMoneyConverter);
  }

  late final IntegerToStringConverter intConverter;
  late final LongToStringConverter? longConverter;
  late final DoubleToStringConverter doubleConverter;

  Container(BaseValues baseValues) {
    HundredsToWordsConverter hundredsToStringConverter =
        HundredsToWordsConverter(
            baseValues.baseNumbers(), baseValues.twoDigitsNumberSeparator());

    NumberToWordsConverter numberToWordsConverter = NumberToWordsConverter(
        hundredsToStringConverter, baseValues.pluralForms());
    intConverter = numberToWordsConverter;
    longConverter = numberToWordsConverter;
    doubleConverter =
        DoubleToBankingMoneyConverter(intConverter, baseValues.currency());
  }

  Container.withConverter(
      this.intConverter, this.longConverter, this.doubleConverter);

  Container.withoutLong(
      this.intConverter, this.longConverter, this.doubleConverter);

  IntegerToStringConverter getIntegerConverter() {
    return intConverter;
  }

  LongToStringConverter? getLongConverter() {
    return longConverter;
  }

  DoubleToStringConverter getBankingMoneyConverter() {
    return doubleConverter;
  }
}
