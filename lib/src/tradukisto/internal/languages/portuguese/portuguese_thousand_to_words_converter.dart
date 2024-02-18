import 'package:sprintf/sprintf.dart';

import '../../integer_to_string_converter.dart';
import '../../multi_form_number.dart';
import '../../support/range.dart';
import '../gender_forms.dart';
import '../gender_type.dart';

class PortugueseThousandToWordsConverter implements IntegerToStringConverter {
  static final bool HAS_NEXT_VALUE = true;
  static final bool HAS_NOT_NEXT_VALUE = false;
  static final int HUNDRED = 100;

  final Map<int, GenderForms> baseValues;
  final Map<int, MultiFormNumber> exceptions;
  final GenderType genderType = GenderType.NON_APPLICABLE;

  PortugueseThousandToWordsConverter(this.baseValues, this.exceptions);

  @override
  String? asWords(int value) {
    return asWordsBool(value, false);
  }

  String? asWordsBool(int value, bool hasNextNumber) {
    if (baseValues.containsKey(value)) {
      return baseValues[value]?.formFor(genderType);
    }
    if (exceptions.containsKey(value)) {
      return hasNextNumber
          ? exceptions[value]?.getRegularForm()
          : exceptions[value]?.getAloneForm();
    }
    if (Range.closed(21, 99).contains(value)) {
      return twoDigitsNumberAsString(value);
    }
    if (Range.closed(101, 999).contains(value)) {
      return threeDigitsNumberAsString(value);
    }
    if (Range.closed(1000, 999999).contains(value)) {
      return thousandsAsString(value);
    }

    throw ArgumentError(sprintf("Can't convert %d", [value]));
  }

  String twoDigitsNumberAsString(int value) {
    int units = value % 10;
    int tens = value - units;
    return sprintf("%s e %s", [asWords(tens), asWords(units)]);
  }

  String threeDigitsNumberAsString(int value) {
    int tensWithUnits = value % 100;
    int hundreds = value - tensWithUnits;
    return sprintf(
        "%s e %s", [asWordsBool(hundreds, true), asWords(tensWithUnits)]);
  }

  String thousandsAsString(int value) {
    int thousands = (value / 1000).floor();
    int other = value % 1000;

    if (isOneThousand(thousands)) {
      return getOneThousandAsWords(other);
    }

    return getThousandsAsWords(thousands, other);
  }

  String getThousandsAsWords(int thousands, int other) {
    if (nothingComesAfter(other)) {
      return sprintf("%s mil", [asWords(thousands)]);
    }
    if (other == HUNDRED) {
      return sprintf("%s mil e %s", [
        asWordsBool(thousands, HAS_NOT_NEXT_VALUE),
        asWordsBool(other, HAS_NOT_NEXT_VALUE)
      ]);
    }
    return sprintf(
        "%s mil %s", [asWords(thousands), asWordsBool(other, HAS_NEXT_VALUE)]);
  }

  String getOneThousandAsWords(int other) {
    if (nothingComesAfter(other)) {
      return "mil";
    }
    if (other == HUNDRED) {
      return sprintf("mil e %s", [asWordsBool(other, HAS_NOT_NEXT_VALUE)]);
    }
    return sprintf("mil %s", [asWordsBool(other, HAS_NEXT_VALUE)]);
  }

  bool nothingComesAfter(int other) {
    return other == 0;
  }

  bool isOneThousand(int thousands) {
    return thousands == 1;
  }
}
