import 'package:untitled1/src/tradukisto/internal/support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../czech/czech_plural_forms.dart';
import '../gender_forms.dart';
import '../gender_type.dart';
import '../plural_forms.dart';

class SlovakValues implements BaseValues {
  @override
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "nula")
        .put(1, GenderForms.genderForms("jeden", "jedna", "jedno"))
        .put(2, GenderForms.genderForms("dva", "dve", "dve"))
        .putString(3, "tri")
        .putString(4, "štyri")
        .putString(5, "päť")
        .putString(6, "šesť")
        .putString(7, "sedem")
        .putString(8, "osem")
        .putString(9, "deväť")
        .putString(10, "desať")
        .putString(11, "jedenásť")
        .putString(12, "dvanásť")
        .putString(13, "trinásť")
        .putString(14, "štrnásť")
        .putString(15, "pätnásť")
        .putString(16, "šestnásť")
        .putString(17, "sedemnásť")
        .putString(18, "osemnásť")
        .putString(19, "devätnásť")
        .putString(20, "dvadsať")
        .putString(30, "tridsať")
        .putString(40, "štyridsať")
        .putString(50, "päťdesiat")
        .putString(60, "šesťdesiat")
        .putString(70, "sedemdesiat")
        .putString(80, "osemdesiat")
        .putString(90, "deväťdesiat")
        .putString(100, "sto")
        .putString(200, "dvesto")
        .putString(300, "tristo")
        .putString(400, "štyristo")
        .putString(500, "päťsto")
        .putString(600, "šesťsto")
        .putString(700, "sedemsto")
        .putString(800, "osemsto")
        .putString(900, "deväťsto")
        .build();
  }

  @override
  List<PluralForms> pluralForms() {
    return [
      CzechPluralForms("tisíc", "tisíce", "tisíc", GenderType.MASCULINE),
      CzechPluralForms("milión", "milióny", "miliónov", GenderType.MASCULINE),
      CzechPluralForms("miliarda", "miliardy", "miliard", GenderType.FEMININE)
    ];
  }

  @override
  String currency() {
    return "€";
  }

  @override
  String twoDigitsNumberSeparator() {
    return ' ';
  }

  Map<int, String> exceptions() {
    return {2: "dve"};
  }
}
