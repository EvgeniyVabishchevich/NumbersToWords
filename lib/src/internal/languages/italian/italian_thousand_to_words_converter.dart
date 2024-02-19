import 'package:sprintf/sprintf.dart';

import '../../gender_aware_integer_to_string_converter.dart';
import '../../support/range.dart';
import '../gender_forms.dart';
import '../gender_type.dart';

class ItalianThousandToWordsConverter
    implements GenderAwareIntegerToStringConverter {
  final Map<int, GenderForms> baseValues;

  ItalianThousandToWordsConverter(this.baseValues);

  @override
  String? asWords(int value, GenderType genderType) {
    if (baseValues.containsKey(value)) {
      return baseValues[value]?.formFor(genderType);
    }
    if (Range.closed(21, 99).contains(value)) {
      return twoDigitsNumberAsString(value, genderType);
    }
    if (Range.closed(101, 999).contains(value)) {
      return threeDigitsNumberAsString(value, genderType);
    }
    if (Range.closed(1000, 999999).contains(value)) {
      return thousandsAsString(value, genderType);
    }

    throw ArgumentError(sprintf("Cannot convert %d", [value]));
  }

  String twoDigitsNumberAsString(int value, GenderType genderType) {
    int units = value % 10;
    int tens = value - units;

    return sprintf(
        "%s%s", [asWords(tens, genderType), asWords(units, genderType)]);
  }

  String threeDigitsNumberAsString(int value, GenderType genderType) {
    int tensWithUnits = value % 100;
    int hundreds = value - tensWithUnits;

    return sprintf("%s%s",
        [asWords(hundreds, genderType), asWords(tensWithUnits, genderType)]);
  }

  String thousandsAsString(int value, GenderType genderType) {
    int thousands = (value / 1000).floor();
    int other = value % 1000;

    if (isOneThousand(thousands)) {
      return getOneThousandAsWords(other, genderType);
    }

    return getThousandsAsWords(thousands, other, genderType);
  }

  String getThousandsAsWords(int thousands, int other, GenderType genderType) {
    if (other == 0) {
      return sprintf("%smila", [asWords(thousands, genderType)]);
    }
    return sprintf("%smila%s",
        [asWords(thousands, genderType), asWords(other, genderType)]);
  }

  String getOneThousandAsWords(int other, GenderType genderType) {
    return sprintf("mille%s", [asWords(other, genderType)]);
  }

  bool isOneThousand(int thousands) {
    return thousands == 1;
  }
}
