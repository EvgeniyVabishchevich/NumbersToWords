import '../gender_type.dart';
import '../plural_forms.dart';

class LatvianPluralForms implements PluralForms {
  final String singularForm;
  final String pluralForm;

  final GenderType genderType;

  LatvianPluralForms(this.singularForm, this.pluralForm, this.genderType);

  @override
  String formFor(int value) {
    if (useSingular(value)) {
      return singularForm;
    } else {
      return pluralForm;
    }
  }

  bool useSingular(int value) {
    return value == 1 || (value % 100 != 11 && value % 10 == 1);
  }

  @override
  GenderType getGenderType() {
    return genderType;
  }
}
