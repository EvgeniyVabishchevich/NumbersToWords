import 'package:sprintf/sprintf.dart';

import '../support/map_support.dart';
import 'gender_type.dart';
import 'missing_form_exception.dart';

class GenderForms {
  late final Map<GenderType, String> forms;

  static GenderForms genderForms(
      String masculineForm, String feminineForm, String neuterForm) {
    return GenderForms(masculineForm, feminineForm, neuterForm);
  }

  static GenderForms genderFormsNonApplicable(String masculineForm,
      String feminineForm, String neuterForm, String nonApplicableForm) {
    return GenderForms.WithForm(
        masculineForm, feminineForm, neuterForm, nonApplicableForm);
  }

  static GenderForms genderForm(String? nonApplicableForm) {
    return GenderForms.OnlyForm(nonApplicableForm!);
  }

  GenderForms(String masculineForm, String feminineForm, String neuterForm) {
    forms = MapSupport.unmodifiableMapOf([
      MapEntry(GenderType.MASCULINE, masculineForm),
      MapEntry(GenderType.FEMININE, feminineForm),
      MapEntry(GenderType.NEUTER, neuterForm)
    ]);
  }

  GenderForms.WithForm(String masculineForm, String feminineForm,
      String neuterForm, String nonApplicableForm) {
    forms = MapSupport.unmodifiableMapOf([
      MapEntry(GenderType.MASCULINE, masculineForm),
      MapEntry(GenderType.FEMININE, feminineForm),
      MapEntry(GenderType.NEUTER, neuterForm),
      MapEntry(GenderType.NON_APPLICABLE, nonApplicableForm)
    ]);
  }

  GenderForms.OnlyForm(String nonApplicableForm) {
    forms = MapSupport.unmodifiableMapOf([
      MapEntry(GenderType.MASCULINE, nonApplicableForm),
      MapEntry(GenderType.FEMININE, nonApplicableForm),
      MapEntry(GenderType.NEUTER, nonApplicableForm),
      MapEntry(GenderType.NON_APPLICABLE, nonApplicableForm)
    ]);
  }

  String? formFor(GenderType gender) {
    validate(gender);
    return forms[gender];
  }

  void validate(GenderType gender) {
    if (!forms.containsKey(gender)) {
      throw MissingFormException(sprintf(
          "No form found for %s. Available forms: %s", [gender, forms]));
    }
  }
}
