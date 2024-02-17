import 'package:untitled1/src/tradukisto/internal/support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../gender_forms.dart';
import '../gender_type.dart';
import '../plural_forms.dart';
import 'czech_plural_forms.dart';

class CzechValues implements BaseValues {
  @override
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "nula")
        .put(1, GenderForms.genderForms("jeden", "jedna", "jedno"))
        .put(2, GenderForms.genderForms("dva", "dvě", "dvě"))
        .putString(3, "tři")
        .putString(4, "čtyři")
        .putString(5, "pět")
        .putString(6, "šest")
        .putString(7, "sedm")
        .putString(8, "osm")
        .putString(9, "devět")
        .putString(10, "deset")
        .putString(11, "jedenáct")
        .putString(12, "dvanáct")
        .putString(13, "třináct")
        .putString(14, "čtrnáct")
        .putString(15, "patnáct")
        .putString(16, "šestnáct")
        .putString(17, "sedmnáct")
        .putString(18, "osmnáct")
        .putString(19, "devatenáct")
        .putString(20, "dvacet")
        .putString(30, "třicet")
        .putString(40, "čtyřicet")
        .putString(50, "padesát")
        .putString(60, "šedesát")
        .putString(70, "sedmdesát")
        .putString(80, "osmdesát")
        .putString(90, "devadesát")
        .putString(100, "sto")
        .putString(200, "dvě stě")
        .putString(300, "tři sta")
        .putString(400, "čtyři sta")
        .putString(500, "pět set")
        .putString(600, "šest set")
        .putString(700, "sedm set")
        .putString(800, "osm set")
        .putString(900, "devět set")
        .build();
  }

  @override
  List<PluralForms> pluralForms() {
    return [
      CzechPluralForms("tisíc", "tisíce", "tisíc", GenderType.MASCULINE),
      CzechPluralForms("milion", "miliony", "milionů", GenderType.MASCULINE),
      CzechPluralForms("miliarda", "miliardy", "miliard", GenderType.FEMININE)
    ];
  }

  @override
  String currency() {
    return "Kč";
  }

  @override
  String twoDigitsNumberSeparator() {
    return ' ';
  }

  Map<int, String> exceptions() {
    return {2: "dvě"};
  }
}
