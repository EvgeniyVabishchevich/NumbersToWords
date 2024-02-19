import 'package:test/test.dart';
import 'package:numbers_to_words/src/internal/converters/hundreds_to_words_converter.dart';
import 'package:numbers_to_words/src/internal/languages/gender_forms.dart';
import 'package:numbers_to_words/src/internal/languages/gender_type.dart';

void main() {
  String separator = "-";

  test("should convert value from list off base values", () {
    HundredsToWordsConverter converter =
        HundredsToWordsConverter({1: GenderForms.genderForm("one")}, separator);
    expect(converter.asWords(1, GenderType.NON_APPLICABLE), "one");
  });

  test("should convert two digits number", () {
    HundredsToWordsConverter converter = HundredsToWordsConverter({
      1: GenderForms.genderForm("one"),
      20: GenderForms.genderForm("twenty")
    }, separator);
    expect(converter.asWords(21, GenderType.NON_APPLICABLE), "twenty-one");
  });

  test("should convert three digits number", () {
    HundredsToWordsConverter converter = HundredsToWordsConverter({
      600: GenderForms.genderForm("six hundred"),
      60: GenderForms.genderForm("sixty"),
      6: GenderForms.genderForm("six")
    }, separator);
    expect(converter.asWords(666, GenderType.NON_APPLICABLE),
        "six hundred sixty-six");
  });

  test(
      "should throw IllegalArgumentException when given number is not supported",
      () {
    HundredsToWordsConverter converter = HundredsToWordsConverter({
      1: GenderForms.genderForm("one"),
    }, separator);
    expect(() => converter.asWords(2, GenderType.NON_APPLICABLE),
        throwsArgumentError);
  });
}
