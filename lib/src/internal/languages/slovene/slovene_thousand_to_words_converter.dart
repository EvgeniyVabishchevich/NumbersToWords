import 'package:sprintf/sprintf.dart';

import '../../gender_aware_integer_to_string_converter.dart';
import '../../support/range.dart';
import '../gender_forms.dart';
import '../gender_type.dart';

class SloveneThousandToWordsConverter
    implements GenderAwareIntegerToStringConverter {
  final Map<int, GenderForms> baseValues;

  SloveneThousandToWordsConverter(this.baseValues);

  @override
  String? asWords(int value, GenderType genderType) {
    if (baseValues.containsKey(value)) {
      return baseValues[value]?.formFor(genderType);
    }
    if (Range.closed(21, 99).contains(value)) {
      return twoDigitsNumberAsString(value);
    }
    if (Range.closed(101, 999).contains(value)) {
      return threeDigitsNumberAsString(value, genderType);
    }
    throw ArgumentError(sprintf("Can't convert %d", [value]));
  }

  String twoDigitsNumberAsString(int value) {
    int units = value % 10;
    int tens = value - units;
    return sprintf("%sin%s", [
      asWords(units, GenderType.FEMININE),
      asWords(tens, GenderType.FEMININE)
    ]);
  }

  String threeDigitsNumberAsString(int value, GenderType genderType) {
    int tensWithUnits = value % 100;
    int hundreds = value - tensWithUnits;
    return sprintf("%s %s",
        [asWords(hundreds, genderType), asWords(tensWithUnits, genderType)]);
  }
}
