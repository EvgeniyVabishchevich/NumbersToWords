import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:untitled1/src/tradukisto/internal/converters/number_to_words_converter.dart';
import 'package:untitled1/src/tradukisto/internal/gender_aware_integer_to_string_converter.dart';
import 'package:untitled1/src/tradukisto/internal/languages/english/english_values.dart';
import 'package:untitled1/src/tradukisto/internal/languages/gender_type.dart';

class MockGenderAwareIntegerToStringConverter extends Mock
    implements GenderAwareIntegerToStringConverter {}

void main() {
  GenderAwareIntegerToStringConverter awareIntegerToStringConverter =
      MockGenderAwareIntegerToStringConverter();
  NumberToWordsConverter converter = NumberToWordsConverter(
      awareIntegerToStringConverter, EnglishValues().pluralForms());

  when(() =>
          awareIntegerToStringConverter.asWords(0, GenderType.NON_APPLICABLE))
      .thenReturn("zero");
  when(() =>
          awareIntegerToStringConverter.asWords(1, GenderType.NON_APPLICABLE))
      .thenReturn("one");
  when(() =>
          awareIntegerToStringConverter.asWords(2, GenderType.NON_APPLICABLE))
      .thenReturn("two");
  when(() =>
          awareIntegerToStringConverter.asWords(3, GenderType.NON_APPLICABLE))
      .thenReturn("three");

  test("should convert 0", () => expect(converter.asWords(0), "zero"));

  test(
      "should convert simply value", () => expect(converter.asWords(1), "one"));

  test(
      "should convert complex value",
      () =>
          expect(converter.asWords(1002003), "one million two thousand three"));

  test("should throw IllegalArgumentException when value is negative",
      () => expect(() => converter.asWords(-1), throwsArgumentError));
}
