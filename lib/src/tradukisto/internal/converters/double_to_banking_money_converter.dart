import 'package:sprintf/sprintf.dart';
import 'package:untitled1/src/tradukisto/internal/support/double_scale_getter.dart';

import '../double_to_string_converter.dart';
import '../integer_to_string_converter.dart';
import '../support/assert.dart';

class DoubleToBankingMoneyConverter implements DoubleToStringConverter {
  static const String FORMAT = "%s %s %02d/100";
  static final int MAXIMAL_DECIMAL_PLACES_COUNT = 2;
  static final int MAX_VALUE = 2147483647;

  final IntegerToStringConverter converter;
  final String currencySymbol;

  DoubleToBankingMoneyConverter(this.converter, this.currencySymbol);

  @override
  String asWords(double value) {
    return asWordsWithSymbol(value, currencySymbol);
  }

  @override
  String asWordsWithSymbol(double value, String currencySymbol) {
    validate(value);

    int units = value.toInt();
    int subunits = ((value - units) * 100).floor();

    return sprintf(
        FORMAT, [converter.asWords(units), currencySymbol, subunits]);
  }

  void validate(double value) {
    Assert.isTrue(
        DoubleScaleGetter.getScale(value) <= MAXIMAL_DECIMAL_PLACES_COUNT,
        () => sprintf(
            "can't transform more than %s decimal places for value %s",
            [MAXIMAL_DECIMAL_PLACES_COUNT, value]));

    Assert.isTrue(
        valueLessThatIntMax(value),
        () => sprintf(
            "can't transform numbers greater than 2147483647 for value %s",
            [value]));

    Assert.isTrue(
        valueGreaterThanOrEqualToZero(value),
        () =>
            sprintf("can't transform negative numbers for value %s", [value]));
  }

  bool valueLessThatIntMax(double value) {
    return value.compareTo(MAX_VALUE + 1) < 0;
  }

  bool valueGreaterThanOrEqualToZero(double value) {
    return !value.isNegative;
  }
}
