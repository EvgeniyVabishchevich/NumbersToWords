import 'package:sprintf/sprintf.dart';

import '../../gender_aware_integer_to_string_converter.dart';
import '../../support/range.dart';
import '../gender_forms.dart';
import '../gender_type.dart';

class DutchThousandToWordsConverter
    implements GenderAwareIntegerToStringConverter {
  final Map<int, GenderForms> baseValues;

  DutchThousandToWordsConverter(this.baseValues);

  @override
  String? asWords(int value, GenderType genderType) {
    if (baseValues.containsKey(value)) {
      return baseValues[value]?.formFor(genderType);
    } else if (Range.closed(21, 99).contains(value)) {
      return twoDigitsNumberAsString(value, genderType);
    } else if (Range.closed(101, 999).contains(value)) {
      return threeDigitsNumberAsString(value, genderType);
    } else if (Range.closed(1000, 999999).contains(value)) {
      return thousandsAsString(value, genderType);
    }

    throw ArgumentError(sprintf("Can't convert %d", [value]));
  }

  String twoDigitsNumberAsString(int value, GenderType genderType) {
    int units = value % 10;
    int tens = value - units;

    // When units are 2 or 3, between the tens and the units
    if (units == 2 || units == 3) {
      return sprintf(
          "%sën%s", [asWords(units, genderType), asWords(tens, genderType)]);
    } else {
      return sprintf(
          "%sen%s", [asWords(units, genderType), asWords(tens, genderType)]);
    }
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
      return sprintf("%sduizend", asWords(thousands, genderType));
    }
    return sprintf("%sduizend%s",
        [asWords(thousands, genderType), asWords(other, genderType)]);
  }

  String getOneThousandAsWords(int other, GenderType genderType) {
    return sprintf("duizend%s", asWords(other, genderType));
  }

  bool isOneThousand(int thousands) {
    return thousands == 1;
  }
}
