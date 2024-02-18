import 'package:sprintf/sprintf.dart';

import '../../integer_to_string_converter.dart';
import '../../multi_form_number.dart';
import '../../support/range.dart';
import '../gender_forms.dart';
import '../gender_type.dart';

class SpanishThousandToWordsConverter implements IntegerToStringConverter {
  static final String MIL = "%s mil";
  static final String MIL_UN = "mil %s";
  static final String S_MIL_S = "%s mil %s";
  static final String IUN_MIL = "%siún mil";
  static final String IUN_MIL_WITH_HUNDRED = "%siún mil %s";
  static final String Y_UN_MIL = "%s y un mil";
  static final String Y_UN_MIL_WITH_HUNDRED = "%s y un mil %s";

  static final bool HAS_NEXT_VALUE = true;
  static final bool HAS_NOT_NEXT_VALUE = false;
  static final int HUNDRED = 100;
  static final GenderType genderType = GenderType.NEUTER;

  final Map<int, GenderForms> baseValues;
  final Map<int, MultiFormNumber> exceptions;

  SpanishThousandToWordsConverter(this.baseValues, this.exceptions);

  @override
  String? asWords(int value) {
    return asWordsBool(value, HAS_NEXT_VALUE);
  }

  String? asWordsBool(int value, bool hasNextNumber) {
    if (baseValues.containsKey(value)) {
      return baseValues[value]?.formFor(genderType);
    }
    if (exceptions.containsKey(value)) {
      if (hasNextNumber) {
        return exceptions[value]?.getRegularForm();
      } else {
        return exceptions[value]?.getAloneForm();
      }
    }
    if (Range.closed(31, 99).contains(value)) {
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
    return sprintf("%s y %s", [asWords(tens), asWords(units)]);
  }

  String threeDigitsNumberAsString(int value) {
    int tensWithUnits = value % 100;
    int hundreds = value - tensWithUnits;
    bool hasNextNumber = tensWithUnits != 0;
    return sprintf("%s %s",
        [asWordsBool(hundreds, hasNextNumber), asWords(tensWithUnits)]);
  }

  String thousandsAsString(int value) {
    int thousands = (value / 1000).floor();
    int other = value % 1000;

    if (isOneThousand(thousands)) {
      return getOneThousandAsWords(other);
    }
    if (isEndsWithOne(thousands)) {
      return getEndWithOneAsWords(thousands, other);
    } else {
      return getThousandsAsWords(thousands, other);
    }
  }

  String getThousandsAsWords(int thousands, int other) {
    if (nothingComesAfter(other)) {
      return sprintf(MIL, [asWords(thousands)]);
    }
    if (other == HUNDRED) {
      return sprintf(S_MIL_S, [
        asWordsBool(thousands, HAS_NOT_NEXT_VALUE),
        asWordsBool(other, HAS_NOT_NEXT_VALUE)
      ]);
    }
    return sprintf(
        S_MIL_S, [asWords(thousands), asWordsBool(other, HAS_NEXT_VALUE)]);
  }

  String getOneThousandAsWords(int other) {
    if (nothingComesAfter(other)) {
      return "mil";
    }
    if (other == HUNDRED) {
      return sprintf(MIL_UN, [asWordsBool(other, HAS_NOT_NEXT_VALUE)]);
    }
    return sprintf(MIL_UN, [asWordsBool(other, HAS_NEXT_VALUE)]);
  }

  String getEndWithOneAsWords(int thousands, int other) {
    int units = thousands % 10;
    int tens = thousands - units;
    if (thousands == 21) {
      if (nothingComesAfter(other)) {
        return sprintf(IUN_MIL, [asWords(tens)?.substring(0, 5)]);
      }
      if (other == HUNDRED) {
        return sprintf(IUN_MIL_WITH_HUNDRED, [
          asWordsBool(tens, HAS_NOT_NEXT_VALUE)?.substring(0, 5),
          asWordsBool(other, HAS_NOT_NEXT_VALUE)
        ]);
      }
      return sprintf(IUN_MIL_WITH_HUNDRED,
          [asWords(tens)?.substring(0, 5), asWordsBool(other, HAS_NEXT_VALUE)]);
    } else {
      if (nothingComesAfter(other)) {
        return sprintf(Y_UN_MIL, asWords(tens));
      }
      if (other == HUNDRED) {
        return sprintf(Y_UN_MIL_WITH_HUNDRED, [
          asWordsBool(tens, HAS_NOT_NEXT_VALUE),
          asWordsBool(other, HAS_NOT_NEXT_VALUE)
        ]);
      }
      return sprintf(Y_UN_MIL_WITH_HUNDRED,
          [asWords(tens), asWordsBool(other, HAS_NEXT_VALUE)]);
    }
  }

  bool nothingComesAfter(int other) {
    return other == 0;
  }

  bool isOneThousand(int thousands) {
    return thousands == 1;
  }

  bool isEndsWithOne(int number) {
    if (number > 20 && number < 100) {
      return ((number.abs()) % 10) == 1;
    }
    return false;
  }
}
