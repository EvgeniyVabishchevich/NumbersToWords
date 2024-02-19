import '../gender_type.dart';
import '../plural_forms.dart';

class KazakhPluralForms implements PluralForms {
  String form;

  KazakhPluralForms(this.form);

  @override
  String formFor(int value) {
    return form;
  }

  @override
  GenderType getGenderType() {
    return GenderType.NON_APPLICABLE;
  }
}
