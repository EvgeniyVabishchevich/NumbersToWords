import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:numbers_to_words/src/internal/converters/double_to_banking_money_converter.dart';
import 'package:numbers_to_words/src/internal/integer_to_string_converter.dart';

class MockIntegerToStringConverter extends Mock
    implements IntegerToStringConverter {}

void main() {
  final integerToStringConverter = MockIntegerToStringConverter();
  var converter = DoubleToBankingMoneyConverter(integerToStringConverter, "£");

  when(() => converter.asWords(123)).thenReturn("one hundred twenty-three");

  test("should convert whole numbers", () {
    expect(converter.asWords(123), "one hundred twenty-three £ 00/100");
  });

  test("should convert value with one digit after decimal point", () {
    expect(converter.asWords(123.4), "one hundred twenty-three £ 40/100");
  });

  test("should not support thousands part of value", () {
    expect(() => converter.asWords(1234.567), throwsArgumentError);
  });

  test("should not support negative values", () {
    expect(() => converter.asWords(-1), throwsArgumentError);
  });

  test("should not support values bigger than 2147483647", () {
    expect(() => converter.asWords(2147483648), throwsArgumentError);
  });
}
