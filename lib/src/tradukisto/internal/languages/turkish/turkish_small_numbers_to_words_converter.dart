import 'package:sprintf/sprintf.dart';

import '../../gender_aware_integer_to_string_converter.dart';
import '../../support/range.dart';
import '../gender_type.dart';
import 'turkish_values.dart';

class TurkishSmallNumbersToWordsConverter
    implements GenderAwareIntegerToStringConverter {
  final TurkishValues turkishValues;
  late final String separator;

  TurkishSmallNumbersToWordsConverter(this.turkishValues) {
    separator = turkishValues.twoDigitsNumberSeparator();
  }

  @override
  String? asWords(int value, GenderType genderType) {
    if (turkishValues.baseNumbers().containsKey(value)) {
      return turkishValues.baseNumbers()[value]?.formFor(genderType);
    }
    if (Range.closed(21, 99).contains(value)) {
      return twoDigitsNumberAsString(value, genderType);
    }
    if (Range.closed(101, 999).contains(value)) {
      return threeDigitsNumberAsString(value, genderType);
    }
    if (value == 1000) {
      return "Bin";
    }
    if (Range.closed(1001, 1999).contains(value)) {
      return oneThousandsAsString(value, genderType);
    }
    if (Range.closed(2000, 999999).contains(value)) {
      return greaterThanOneThousandsAsString(value, genderType);
    }

    throw ArgumentError(sprintf("Can't convert %d", [value]));
  }

  String twoDigitsNumberAsString(int value, GenderType genderType) {
    int units = value % 10;
    int tens = value - units;
    return sprintf("%s$separator%s",
        [asWords(tens, genderType), asWords(units, genderType)]);
  }

  String threeDigitsNumberAsString(int value, GenderType genderType) {
    int tensWithUnits = value % 100;
    int hundreds = value - tensWithUnits;
    return sprintf("%s$separator%s",
        [asWords(hundreds, genderType), asWords(tensWithUnits, genderType)]);
  }

  String greaterThanOneThousandsAsString(int value, GenderType genderType) {
    int thousands = (value / 1000).floor();
    int other = value % 1000;

    if (other == 0) {
      return sprintf("%s${separator}Bin", asWords(thousands, genderType));
    }
    return sprintf("%s${separator}Bin$separator%s",
        [asWords(thousands, genderType), asWords(other, genderType)]);
  }

  String oneThousandsAsString(int value, GenderType genderType) {
    int other = value % 1000;
    return sprintf("Bin$separator%s", asWords(other, genderType));
  }
}
