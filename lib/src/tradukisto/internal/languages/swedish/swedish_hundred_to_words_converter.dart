import 'package:sprintf/sprintf.dart';

import '../../gender_aware_integer_to_string_converter.dart';
import '../../support/range.dart';
import '../gender_forms.dart';
import '../gender_type.dart';

class SwedishHundredToWordsConverter
    implements GenderAwareIntegerToStringConverter {
  final Map<int, GenderForms> swedishBaseValues;

  SwedishHundredToWordsConverter(this.swedishBaseValues);

  @override
  String? asWords(int value, GenderType swedishGenderType) {
    if (swedishBaseValues.containsKey(value)) {
      return swedishBaseValues[value]?.formFor(swedishGenderType);
    } else if (Range.closed(21, 99).contains(value)) {
      return twoDigitsNumberAsString(value, swedishGenderType);
    } else if (Range.closed(101, 999).contains(value)) {
      return threeDigitsNumberAsString(value, swedishGenderType);
    }
    throw ArgumentError(sprintf("Can't convert %d", [value]));
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
    return sprintf("%s och %s",
        [asWords(hundreds, genderType), asWords(tensWithUnits, genderType)]);
  }
}
