import 'package:untitled1/src/tradukisto/internal/support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../gender_forms.dart';
import '../gender_type.dart';
import '../plural_forms.dart';
import '../slavic_plural_forms.dart';

class BulgarianValues implements BaseValues {
  @override
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "нула")
        .put(
            1,
            GenderForms.genderFormsNonApplicable(
                "един", "една", "едно", "един"))
        .put(
            2, GenderForms.genderFormsNonApplicable("два", "две", "две", "два"))
        .putString(3, "три")
        .putString(4, "четири")
        .putString(5, "пет")
        .putString(6, "шест")
        .putString(7, "седем")
        .putString(8, "осем")
        .putString(9, "девет")
        .putString(10, "десет")
        .putString(11, "единадесет")
        .putString(12, "дванадесет")
        .putString(13, "тринадесет")
        .putString(14, "четиринадесет")
        .putString(15, "петнадесет")
        .putString(16, "шестнадесет")
        .putString(17, "седемнадесет")
        .putString(18, "осемнадесет")
        .putString(19, "деветнадесет")
        .putString(20, "двадесет")
        .putString(30, "тридесет")
        .putString(40, "четиридесет")
        .putString(50, "петдесет")
        .putString(60, "шестдесет")
        .putString(70, "седемдесет")
        .putString(80, "осемдесет")
        .putString(90, "деветдесет")
        .putString(100, "сто")
        .putString(200, "двеста")
        .putString(300, "триста")
        .putString(400, "четиристотин")
        .putString(500, "петстотин")
        .putString(600, "шестстотин")
        .putString(700, "седемстотин")
        .putString(800, "осемстотин")
        .putString(900, "деветстотин")
        .build();
  }

  @override
  List<PluralForms> pluralForms() {
    return [
      SlavicPluralForms("", "", "", GenderType.MASCULINE),
      SlavicPluralForms("хиляди", "хиляди", "хиляди", GenderType.FEMININE),
      SlavicPluralForms("милион", "милиона", "милиона", GenderType.MASCULINE),
      SlavicPluralForms("милиард", "милиарда", "милиарда", GenderType.MASCULINE)
    ];
  }

  @override
  String currency() {
    return "лв";
  }

  @override
  String twoDigitsNumberSeparator() {
    return ' ';
  }

  String oneThousandException() {
    return "хиляда";
  }
}
