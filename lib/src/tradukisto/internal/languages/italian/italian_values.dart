import 'package:untitled1/src/tradukisto/internal/support/base_numbers_builder.dart';

import '../gender_forms.dart';
import '../gender_type.dart';
import '../plural_forms.dart';
import '../regular_plural_forms.dart';

class ItalianValues {
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "zero")
        .putString(1, "un")
        .putString(2, "due")
        .putString(3, "tre")
        .putString(4, "quattro")
        .putString(5, "cinque")
        .putString(6, "sei")
        .putString(7, "sette")
        .putString(8, "otto")
        .putString(9, "nove")
        .putString(10, "dieci")
        .putString(11, "undici")
        .putString(12, "dodici")
        .putString(13, "tredici")
        .putString(14, "quattordici")
        .putString(15, "quindici")
        .putString(16, "sedici")
        .putString(17, "diciassette")
        .putString(18, "diciotto")
        .putString(19, "diciannove")
        .putString(20, "venti")
        .putString(21, "ventuno")
        .putString(28, "ventotto")
        .putString(30, "trenta")
        .putString(31, "trentuno")
        .putString(38, "trentotto")
        .putString(40, "quaranta")
        .putString(41, "quarantuno")
        .putString(48, "quarantotto")
        .putString(50, "cinquanta")
        .putString(51, "cinquantuno")
        .putString(58, "cinquantotto")
        .putString(60, "sessanta")
        .putString(61, "sessantuno")
        .putString(68, "sessantotto")
        .putString(70, "settanta")
        .putString(71, "settantuno")
        .putString(78, "settantotto")
        .putString(80, "ottanta")
        .putString(81, "ottantuno")
        .putString(88, "ottantotto")
        .putString(90, "novanta")
        .putString(91, "novantuno")
        .putString(98, "novantotto")
        .putString(100, "cento")
        .putString(200, "duecento")
        .putString(300, "trecento")
        .putString(400, "quattrocento")
        .putString(500, "cinquecento")
        .putString(600, "seicento")
        .putString(700, "settecento")
        .putString(800, "ottocento")
        .putString(900, "novecento")
        .build();
  }

  List<PluralForms> pluralForms() {
    return [
      RegularPluralForms("milione", "milioni", GenderType.MASCULINE),
      RegularPluralForms("miliardo", "miliardi", GenderType.MASCULINE)
    ];
  }

  String currency() {
    return "€";
  }

  Map<int, String> exceptions() {
    return {
      1: "uno",
      1000: "mille",
      1000000: "unmilione",
      1000000000: "unmiliardo"
    };
  }
}
