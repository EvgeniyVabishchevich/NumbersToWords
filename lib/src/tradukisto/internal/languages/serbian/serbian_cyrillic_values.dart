import 'package:untitled1/src/tradukisto/internal/support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../gender_forms.dart';
import '../gender_type.dart';
import '../plural_forms.dart';
import '../slavic_plural_forms.dart';

class SerbianCyrillicValues implements BaseValues {
  @override
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "нула")
        .put(
            1,
            GenderForms.genderFormsNonApplicable(
                "један", "једна", "један", "један"))
        .put(
            2, GenderForms.genderFormsNonApplicable("два", "две", "две", "два"))
        .putString(3, "три")
        .putString(4, "четири")
        .putString(5, "пет")
        .putString(6, "шест")
        .putString(7, "седам")
        .putString(8, "осам")
        .putString(9, "девет")
        .putString(10, "десет")
        .putString(11, "једанаест")
        .putString(12, "дванаест")
        .putString(13, "тринаест")
        .putString(14, "четрнаест")
        .putString(15, "петнаест")
        .putString(16, "шеснаест")
        .putString(17, "седамнаест")
        .putString(18, "осамнаест")
        .putString(19, "деветнаест")
        .putString(20, "двадесет")
        .putString(30, "тридесет")
        .putString(40, "четрдесет")
        .putString(50, "педесет")
        .putString(60, "шездесет")
        .putString(70, "седамдесет")
        .putString(80, "осамдесет")
        .putString(90, "деведесет")
        .putString(100, "сто")
        .putString(200, "двеста")
        .putString(300, "триста")
        .putString(400, "четиристо")
        .putString(500, "петсто")
        .putString(600, "шестсто")
        .putString(700, "седамсто")
        .putString(800, "осамсто")
        .putString(900, "деветсто")
        .build();
  }

  @override
  List<PluralForms> pluralForms() {
    return [
      SlavicPluralForms("", "", "", GenderType.MASCULINE),
      SlavicPluralForms("хиљада", "хиљаде", "хиљада", GenderType.FEMININE),
      SlavicPluralForms("милион", "милиона", "милиона", GenderType.MASCULINE),
      SlavicPluralForms(
          "милијарда", "милијарде", "милијарди", GenderType.FEMININE)
    ];
  }

  @override
  String currency() {
    return "РСД";
  }

  @override
  String twoDigitsNumberSeparator() {
    return ' ';
  }
}
