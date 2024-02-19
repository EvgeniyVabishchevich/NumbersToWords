import '../gender_type.dart';
import '../plural_forms.dart';

class EnglishPluralForms implements PluralForms {
  final String form;

  EnglishPluralForms(this.form);

  @override
  String formFor(int value) {
    return form;
  }

  @override
  GenderType getGenderType() {
    return GenderType.NON_APPLICABLE;
  }
}
