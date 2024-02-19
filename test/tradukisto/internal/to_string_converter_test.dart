import 'package:test/test.dart';
import 'package:untitled1/src/tradukisto/internal/gender_aware_integer_to_string_converter.dart';
import 'package:untitled1/src/tradukisto/internal/integer_to_string_converter.dart';
import 'package:untitled1/src/tradukisto/internal/languages/gender_forms.dart';
import 'package:untitled1/src/tradukisto/internal/languages/portuguese/portuguese_thousand_to_words_converter.dart';
import 'package:untitled1/src/tradukisto/internal/to_string_converter.dart';

void main() {
  IntegerToStringConverter integerToStringConverter = PortugueseThousandToWordsConverter({1: GenderForms.genderForm("um")}, {});

  test("should convert from IntegerToStringConverter to GenderAwareIntegerToStringConverter", () =>
  expect(ToStringConverter.toGenderAwareInteger(integerToStringConverter), isA<GenderAwareIntegerToStringConverter>()));
}