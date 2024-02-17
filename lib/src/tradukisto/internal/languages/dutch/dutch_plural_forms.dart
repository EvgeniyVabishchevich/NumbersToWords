import '../gender_type.dart';
import '../plural_forms.dart';

class DutchPluralForms implements PluralForms {
  final String form;

  DutchPluralForms(this.form);

  @override
  String formFor(int value) {
    return form;
  }

  @override
  GenderType getGenderType() {
    return GenderType.NON_APPLICABLE;
  }
}
