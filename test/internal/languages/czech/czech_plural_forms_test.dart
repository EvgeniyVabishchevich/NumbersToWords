import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';
import 'package:numbers_to_words/src/internal/languages/czech/czech_plural_forms.dart';
import 'package:numbers_to_words/src/internal/languages/gender_type.dart';
import 'package:numbers_to_words/src/internal/languages/plural_forms.dart';

void main() {
  PluralForms pluralForms = CzechPluralForms(
      "milion", "miliony", "milionů", GenderType.NON_APPLICABLE);

  test("should provide value for singular form", () {
    expect(pluralForms.formFor(1), "milion");
  });

  parameterizedTest("should provide value for plural form", [2, 3, 4],
      p1((int value) {
    expect(pluralForms.formFor(value), "miliony");
  }));

  List<int> testValues = [for (int i = 5; i < 100; i += 1) i];
  testValues.addAll([for (int i = 1735; i < 1741; i += 1) i]);

  parameterizedTest("should provide value for genitive plural form", testValues,
      p1((int value) {
    expect(pluralForms.formFor(value), "milionů");
  }));
}
