import 'package:untitled1/src/tradukisto/internal/double_to_string_converter.dart';
import 'package:untitled1/src/tradukisto/internal/integer_to_string_converter.dart';
import 'package:untitled1/src/tradukisto/internal/long_to_string_converter.dart';
import 'package:untitled1/src/tradukisto/long_value_converters.dart';
import 'package:untitled1/src/tradukisto/money_converters.dart';
import 'package:untitled1/src/tradukisto/value_converters.dart';

void main() {
  LongToStringConverter longToStringConverter =
      LongValueConverters.SWEDISH_LONG.converter;
  DoubleToStringConverter doubleToStringConverter =
      MoneyConverters.RUSSIAN_BANKING_MONEY_VALUE.converter;
  IntegerToStringConverter integerToStringConverter =
      ValueConverters.RUSSIAN_INTEGER.converter;

  print(longToStringConverter.asWords(123123213));
  print(doubleToStringConverter.asWords(1232353132.12));
  print(integerToStringConverter.asWords(123123));
}
