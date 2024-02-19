import '../../base_values.dart';
import '../gender_forms.dart';
import '../gender_type.dart';
import '../plural_forms.dart';
import 'czech_plural_forms.dart';
import 'czech_values.dart';

class CzechValuesForSmallNumbers implements BaseValues {
  final CzechValues originalValues = CzechValues();

  @override
  Map<int, GenderForms> baseNumbers() {
    Map<int, GenderForms> baseNumbers = originalValues.baseNumbers();
    baseNumbers[1] =
        GenderForms.genderForm(baseNumbers[1]?.formFor(GenderType.FEMININE));
    baseNumbers[2] =
        GenderForms.genderForm(baseNumbers[2]?.formFor(GenderType.MASCULINE));
    return baseNumbers;
  }

  @override
  List<PluralForms> pluralForms() {
    return [CzechPluralForms.Empty()];
  }

  @override
  String currency() {
    return originalValues.currency();
  }

  @override
  String twoDigitsNumberSeparator() {
    return ' ';
  }
}
