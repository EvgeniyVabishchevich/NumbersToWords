import 'package:sprintf/sprintf.dart';

import '../../integer_to_string_converter.dart';
import '../../support/range.dart';
import '../gender_forms.dart';
import '../gender_type.dart';

class JapaneseThousandToWordsConverter implements IntegerToStringConverter {
  final Map<int, GenderForms> baseValues;

  JapaneseThousandToWordsConverter(this.baseValues);

  @override
  String? asWords(int value) {
    if (baseValues.containsKey(value)) {
      return baseValues[value]?.formFor(GenderType.NON_APPLICABLE);
    }
    if (Range.closed(11, 99).contains(value)) {
      return twoDigitsNumberAsString(value);
    }
    if (Range.closed(101, 999).contains(value)) {
      return threeDigitsNumberAsString(value);
    }
    if (Range.closed(1001, 9999).contains(value)) {
      return fourDigitsNumberAsString(value);
    }
    throw ArgumentError(sprintf("Can't convert %d", value));
  }

  String twoDigitsNumberAsString(int value) {
    int units = value % 10;
    int tens = value - units;
    return sprintf("%s%s", [asWords(tens), asWords(units)]);
  }

  String threeDigitsNumberAsString(int value) {
    int units = value % 100;
    int hundreds = value - units;
    return sprintf("%s%s", [asWords(hundreds), asWords(units)]);
  }

  String fourDigitsNumberAsString(int value) {
    int units = value % 1000;
    int thousands = value - units;
    return sprintf("%s%s", [asWords(thousands), asWords(units)]);
  }
}
