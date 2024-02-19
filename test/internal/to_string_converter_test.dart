import 'package:test/test.dart';
import 'package:numbers_to_words/src/internal/gender_aware_integer_to_string_converter.dart';
import 'package:numbers_to_words/src/internal/integer_to_string_converter.dart';
import 'package:numbers_to_words/src/internal/languages/gender_forms.dart';
import 'package:numbers_to_words/src/internal/languages/portuguese/portuguese_thousand_to_words_converter.dart';
import 'package:numbers_to_words/src/internal/to_string_converter.dart';

void main() {
  IntegerToStringConverter integerToStringConverter = PortugueseThousandToWordsConverter({1: GenderForms.genderForm("um")}, {});

  test("should convert from IntegerToStringConverter to GenderAwareIntegerToStringConverter", () =>
  expect(ToStringConverter.toGenderAwareInteger(integerToStringConverter), isA<GenderAwareIntegerToStringConverter>()));
}