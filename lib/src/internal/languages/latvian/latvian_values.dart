import 'package:numbers_to_words/src/internal/support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../gender_forms.dart';
import '../gender_type.dart';
import '../plural_forms.dart';
import 'latvian_plural_forms.dart';

class LatvianValues implements BaseValues {
  @override
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "nulle")
        .put(1, GenderForms.genderForms("viens", "viena", "viens"))
        .putString(2, "divi")
        .putString(3, "trīs")
        .putString(4, "četri")
        .putString(5, "pieci")
        .putString(6, "seši")
        .putString(7, "septiņi")
        .putString(8, "astoņi")
        .putString(9, "deviņi")
        .putString(10, "desmit")
        .putString(11, "vienpadsmit")
        .putString(12, "divpadsmit")
        .putString(13, "trīspadsmit")
        .putString(14, "četrpadsmit")
        .putString(15, "piecpadsmit")
        .putString(16, "sešpadsmit")
        .putString(17, "septiņpadsmit")
        .putString(18, "astoņpadsmit")
        .putString(19, "deviņpadsmit")
        .putString(20, "divdesmit")
        .putString(30, "trīsdesmit")
        .putString(40, "četrdesmit")
        .putString(50, "piecdesmit")
        .putString(60, "sešdesmit")
        .putString(70, "septiņdesmit")
        .putString(80, "astoņdesmit")
        .putString(90, "deviņdesmit")
        .putString(100, "viens simts")
        .putString(200, "divi simti")
        .putString(300, "trīs simti")
        .putString(400, "četri simti")
        .putString(500, "pieci simti")
        .putString(600, "seši simti")
        .putString(700, "septiņi simti")
        .putString(800, "astoņi simti")
        .putString(900, "deviņi simti")
        .build();
  }

  @override
  List<PluralForms> pluralForms() {
    return [
      LatvianPluralForms("", "", GenderType.MASCULINE),
      LatvianPluralForms("tūkstotis", "tūkstoši", GenderType.MASCULINE),
      LatvianPluralForms("miljons", "miljoni", GenderType.MASCULINE),
      LatvianPluralForms("miljards", "miljardi", GenderType.MASCULINE)
    ];
  }

  @override
  String currency() {
    return "EUR";
  }

  @override
  String twoDigitsNumberSeparator() {
    return ' ';
  }
}
