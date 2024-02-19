import '../gender_type.dart';
import '../plural_forms.dart';

class TurkishPluralForms implements PluralForms {
  final String form;

  TurkishPluralForms(this.form);

  @override
  String formFor(int value) {
    return form;
  }

  @override
  GenderType getGenderType() {
    return GenderType.NON_APPLICABLE;
  }
}
