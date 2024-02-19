import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';
import 'package:numbers_to_words/src/internal/languages/english/english_plural_forms.dart';
import 'package:numbers_to_words/src/internal/languages/plural_forms.dart';

void main() {
  PluralForms pluralForms = EnglishPluralForms("thousand");

  parameterizedTest("should provide value for singular form",
      [for (int i = 0; i < 100; i += 1) i], p1((int value) {
    expect(pluralForms.formFor(value), "thousand");
  }));
}
