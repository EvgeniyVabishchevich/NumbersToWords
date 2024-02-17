import '../support/range.dart';
import 'gender_type.dart';
import 'plural_forms.dart';

class SlovenePluralForms implements PluralForms {
  final String singularForm;
  final String dualForm;
  final String pluralForm;
  final String genitivePluralForm;

  final GenderType genderType;

  SlovenePluralForms(this.singularForm, this.dualForm, this.pluralForm,
      this.genitivePluralForm, this.genderType);

  @override
  String formFor(int value) {
    if (shouldUseSingularForm(value)) {
      return singularForm;
    }
    if (shouldUseDualForm(value)) {
      return dualForm;
    }
    if (shouldUsePluralForm(value)) {
      return pluralForm;
    }
    return genitivePluralForm;
  }

  bool shouldUseSingularForm(int value) {
    return value == 1 || value % 100 == 1;
  }

  bool shouldUseDualForm(int value) {
    return value == 2 || value % 100 == 2;
  }

  bool shouldUsePluralForm(int value) {
    return Range.closed(3, 4).contains(value % 100);
  }

  @override
  GenderType getGenderType() {
    return genderType;
  }
}
