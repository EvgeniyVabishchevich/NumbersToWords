import '../../support/range.dart';
import '../gender_type.dart';
import '../plural_forms.dart';

class CzechPluralForms implements PluralForms {
  late final String singularForm;
  late final String pluralForm;
  late final String genitivePluralForm;

  late final GenderType genderType;

  CzechPluralForms(this.singularForm, this.pluralForm, this.genitivePluralForm,
      this.genderType);

  CzechPluralForms.Empty() {
    singularForm = "";
    pluralForm = "";
    genitivePluralForm = "";
    genderType = GenderType.NON_APPLICABLE;
  }

  @override
  String formFor(int value) {
    if (value == 1) {
      return singularForm;
    }
    if (Range.closed(2, 4).contains(value)) {
      return pluralForm;
    }

    return genitivePluralForm;
  }

  @override
  GenderType getGenderType() {
    return genderType;
  }
}
