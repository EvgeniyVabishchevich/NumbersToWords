import '../../support/range.dart';
import '../gender_type.dart';
import '../plural_forms.dart';

class PolishPluralForms implements PluralForms {
  final String singularForm;
  final String pluralForm;
  final String genitivePluralForm;

  late final GenderType genderType;

  PolishPluralForms.NonApplicable(
      this.singularForm, this.pluralForm, this.genitivePluralForm) {
    genderType = GenderType.NON_APPLICABLE;
  }

  PolishPluralForms(this.singularForm, this.pluralForm, this.genitivePluralForm,
      this.genderType);

  @override
  String formFor(int value) {
    if (value == 1) {
      return singularForm;
    }
    if (usePluralForm(value)) {
      return pluralForm;
    }
    return genitivePluralForm;
  }

  bool usePluralForm(int value) {
    return Range.closed(2, 4).contains(value % 10) &&
        !Range.closed(12, 14).contains(value % 100);
  }

  @override
  GenderType getGenderType() {
    return genderType;
  }
}
