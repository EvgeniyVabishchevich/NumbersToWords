import 'package:untitled1/src/tradukisto/internal/support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../gender_forms.dart';
import '../gender_type.dart';
import '../plural_forms.dart';
import '../slovene_plural_forms.dart';

class SloveneValues implements BaseValues {
  @override
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "nič")
        .put(1, GenderForms.genderFormsNonApplicable("en", "ena", "ena", "ena"))
        .put(
            2, GenderForms.genderFormsNonApplicable("dva", "dve", "dve", "dva"))
        .put(3,
            GenderForms.genderFormsNonApplicable("trije", "tri", "tri", "tri"))
        .put(
            4,
            GenderForms.genderFormsNonApplicable(
                "štirije", "štiri", "štiri", "štiri"))
        .putString(5, "pet")
        .putString(6, "šest")
        .putString(7, "sedem")
        .putString(8, "osem")
        .putString(9, "devet")
        .putString(10, "deset")
        .putString(11, "enajst")
        .putString(12, "dvanajst")
        .putString(13, "trinajst")
        .putString(14, "štirinajst")
        .putString(15, "petnajst")
        .putString(16, "šestnajst")
        .putString(17, "sedemnajst")
        .putString(18, "osemnajst")
        .putString(19, "devetnajst")
        .putString(20, "dvajset")
        .putString(30, "trideset")
        .putString(40, "štirideset")
        .putString(50, "petdeset")
        .putString(60, "šestdeset")
        .putString(70, "sedemdeset")
        .putString(80, "osemdeset")
        .putString(90, "devetdeset")
        .putString(100, "sto")
        .putString(200, "dvesto")
        .putString(300, "tristo")
        .putString(400, "štiristo")
        .putString(500, "petsto")
        .putString(600, "šeststo")
        .putString(700, "sedemsto")
        .putString(800, "osemsto")
        .putString(900, "devetsto")
        .build();
  }

  @override
  List<PluralForms> pluralForms() {
    return [
      SlovenePluralForms("", "", "", "", GenderType.FEMININE),
      SlovenePluralForms("tisoč", "tisoč", "tisoč", "tisoč", GenderType.NEUTER),
      SlovenePluralForms(
          "milijon", "milijona", "milijone", "milijonov", GenderType.MASCULINE),
      SlovenePluralForms("milijarda", "milijardi", "milijarde", "milijard",
          GenderType.FEMININE)
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
}
