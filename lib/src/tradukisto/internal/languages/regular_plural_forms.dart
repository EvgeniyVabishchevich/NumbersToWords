import 'gender_type.dart';
import 'plural_forms.dart';

class RegularPluralForms implements PluralForms {
  late final String singularForm;
  late final String pluralForm;
  late final GenderType genderType;

  RegularPluralForms(this.singularForm, this.pluralForm, this.genderType);

  RegularPluralForms.nonApplicable(this.singularForm, this.pluralForm) {
    genderType = GenderType.NON_APPLICABLE;
  }

  @override
  String formFor(int value) {
    return (value == 1) ? singularForm : pluralForm;
  }

  @override
  GenderType getGenderType() {
    return genderType;
  }
}
