import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:numbers_to_words/src/internal/integer_to_string_converter.dart';
import 'package:numbers_to_words/src/internal/languages/czech/czech_integer_to_words_converter.dart';

class MockIntegerToStringConverter extends Mock
    implements IntegerToStringConverter {}

void main() {
  final smallNumbersConverter = MockIntegerToStringConverter();
  final bigNumbersConverter = MockIntegerToStringConverter();
  Map<int, String> exceptions = {2: "dvě"};
  CzechIntegerToWordsConverter converter = CzechIntegerToWordsConverter(
      bigNumbersConverter, smallNumbersConverter, exceptions);

  when(() => bigNumbersConverter.asWords(123456))
      .thenReturn("sto dvacet tři milionů čtyři sta padesát ąest tisíc");
  when(() => smallNumbersConverter.asWords(789))
      .thenReturn("sedm set osmdesát devět");
  when(() => smallNumbersConverter.asWords(0)).thenReturn("nula");

  test('should convert zero', () {
    expect(converter.asWords(0), "nula");
  });

  test('should convert only big number', () {
    expect(converter.asWords(123456000),
        "sto dvacet tři milionů čtyři sta padesát ąest tisíc");
  });

  test('should convert only small number', () {
    expect(converter.asWords(789), "sedm set osmdesát devět");
  });

  test('should convert complex number', () {
    expect(converter.asWords(123456789),
        "sto dvacet tři milionů čtyři sta padesát ąest tisíc sedm set osmdesát devět");
  });

  test('should convert excluded value', () {
    expect(converter.asWords(2), "dvě");
  });
}
