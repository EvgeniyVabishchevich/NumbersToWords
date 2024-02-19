import 'languages/gender_forms.dart';
import 'languages/plural_forms.dart';

abstract interface class BaseValues {
  Map<int, GenderForms> baseNumbers();

  List<PluralForms> pluralForms();

  String currency();

  String twoDigitsNumberSeparator();
}
