import 'package:untitled1/src/tradukisto/internal/support/base_numbers_builder.dart';

import '../gender_forms.dart';
import '../gender_type.dart';
import '../plural_forms.dart';
import '../regular_plural_forms.dart';

class SwedishValues {
  // Note: Swedish uses 'common' and 'neuter' gender types, but these seem to transfer nicely for numbers to existing
  // masculine and feminine gender types for common, and neuter and non-applicable gender types for neuter.
  // Regarding base numbers, only 1 has multiple gender types: 1 and 100 being neuter ('ett'), otherwise common ('en')
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "noll")
        .put(1, GenderForms.genderFormsNonApplicable("en", "en", "ett", "ett"))
        .putString(2, "två")
        .putString(3, "tre")
        .putString(4, "fyra")
        .putString(5, "fem")
        .putString(6, "sex")
        .putString(7, "sju")
        .putString(8, "åtta")
        .putString(9, "nio")
        .putString(10, "tio")
        .putString(11, "elva")
        .putString(12, "tolv")
        .putString(13, "tretton")
        .putString(14, "fjorton")
        .putString(15, "femton")
        .putString(16, "sexton")
        .putString(17, "sjutton")
        .putString(18, "arton")
        .putString(19, "nitton")
        .putString(20, "tjugo")
        .putString(30, "trettio")
        .putString(40, "fyrtio")
        .putString(50, "femtio")
        .putString(60, "sextio")
        .putString(70, "sjuttio")
        .putString(80, "åttio")
        .putString(90, "nittio")
        .putString(100, "ett hundra")
        .putString(200, "två hundra")
        .putString(300, "tre hundra")
        .putString(400, "fyra hundra")
        .putString(500, "fem hundra")
        .putString(600, "sex hundra")
        .putString(700, "sju hundra")
        .putString(800, "åtta hundra")
        .putString(900, "nio hundra")
        .build();
  }

  List<PluralForms> pluralForms() {
    // Note: in Swedish there are common and neuter gender types. In this case, common is equivalent to feminine
    return [
      RegularPluralForms("", "", GenderType.NON_APPLICABLE),
      RegularPluralForms("tusen", "tusen", GenderType.NEUTER),
      // thousand
      RegularPluralForms("miljon", "miljoner", GenderType.FEMININE),
      // million
      RegularPluralForms("miljard", "miljarder", GenderType.FEMININE),
      // billion
      RegularPluralForms("biljon", "biljoner", GenderType.FEMININE),
      // trillion
      RegularPluralForms("biljard", "biljarder", GenderType.FEMININE),
      // quadrillion
      RegularPluralForms("triljon", "triljoner", GenderType.FEMININE)
      // quintillion
    ];
  }

  String currency() {
    return "kr";
  }
}
