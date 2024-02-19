import 'package:test/test.dart';
import 'package:untitled1/src/tradukisto/internal/languages/gender_forms.dart';
import 'package:untitled1/src/tradukisto/internal/support/base_numbers_builder.dart';

void main() {
  BaseNumbersBuilder builder = BaseNumbersBuilder.baseNumbersBuilder();

  setUp(() => builder = BaseNumbersBuilder.baseNumbersBuilder());

  test(
      "should throw NumberAlreadyMappedException when trying to remap a number with String",
      () {
    builder.putString(1, 'some form');

    expect(() => builder.putString(1, "some other form"),
        throwsA(TypeMatcher<NumberAlreadyMappedException>()));
  });

  test(
      'should throw NumberAlreadyMappedException when trying to remap a number with GenderForms',
      () {
    builder.put(1, GenderForms.OnlyForm("some form"));

    expect(() => builder.put(1, GenderForms.OnlyForm("some other form")),
        throwsA(TypeMatcher<NumberAlreadyMappedException>()));
  });

  test(
      "should throw NumberAlreadyMappedException when trying to remap a number from String to GenderForms",
      () {
    builder.put(1, GenderForms.OnlyForm("some form"));

    expect(() => builder.putString(1, "some form"),
        throwsA(TypeMatcher<NumberAlreadyMappedException>()));
  });

  test(
      "should throw NumberAlreadyMappedException when trying to remap a number from GenderForms to String",
      () {
    builder.put(1, GenderForms.OnlyForm("some other form"));

    expect(() => builder.putString(1, "some form"),
        throwsA(TypeMatcher<NumberAlreadyMappedException>()));
  });
}
