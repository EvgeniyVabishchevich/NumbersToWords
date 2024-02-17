import 'package:untitled1/src/tradukisto/internal/support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../gender_forms.dart';
import '../gender_type.dart';
import '../plural_forms.dart';
import '../regular_plural_forms.dart';

class FrenchValues implements BaseValues {
  @override
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "zéro")
        .putString(1, "un")
        .putString(2, "deux")
        .putString(3, "trois")
        .putString(4, "quatre")
        .putString(5, "cinq")
        .putString(6, "six")
        .putString(7, "sept")
        .putString(8, "huit")
        .putString(9, "neuf")
        .putString(10, "dix")
        .putString(11, "onze")
        .putString(12, "douze")
        .putString(13, "treize")
        .putString(14, "quatorze")
        .putString(15, "quinze")
        .putString(16, "seize")
        .putString(17, "dix-sept")
        .putString(18, "dix-huit")
        .putString(19, "dix-neuf")
        .putString(20, "vingt")
        .putString(21, "vingt-et-un")
        .putString(30, "trente")
        .putString(31, "trente-et-un")
        .putString(40, "quarante")
        .putString(41, "quarante-et-un")
        .putString(50, "cinquante")
        .putString(51, "cinquante-et-un")
        .putString(60, "soixante")
        .putString(61, "soixante-et-un")
        .putString(70, "soixante-dix")
        .putString(71, "soixante-et-onze")
        .putString(72, "soixante-douze")
        .putString(73, "soixante-treize")
        .putString(74, "soixante-quatorze")
        .putString(75, "soixante-quinze")
        .putString(76, "soixante-seize")
        .putString(77, "soixante-dix-sept")
        .putString(78, "soixante-dix-huit")
        .putString(79, "soixante-dix-neuf")
        .putString(80, "quatre-vingts")
        .putString(81, "quatre-vingt-un")
        .putString(82, "quatre-vingt-deux")
        .putString(83, "quatre-vingt-trois")
        .putString(84, "quatre-vingt-quatre")
        .putString(85, "quatre-vingt-cinq")
        .putString(86, "quatre-vingt-six")
        .putString(87, "quatre-vingt-sept")
        .putString(88, "quatre-vingt-huit")
        .putString(89, "quatre-vingt-neuf")
        .putString(90, "quatre-vingt-dix")
        .putString(91, "quatre-vingt-onze")
        .putString(92, "quatre-vingt-douze")
        .putString(93, "quatre-vingt-treize")
        .putString(94, "quatre-vingt-quatorze")
        .putString(95, "quatre-vingt-quinze")
        .putString(96, "quatre-vingt-seize")
        .putString(97, "quatre-vingt-dix-sept")
        .putString(98, "quatre-vingt-dix-huit")
        .putString(99, "quatre-vingt-dix-neuf")
        .putString(100, "cent")
        .putString(200, "deux cent")
        .putString(300, "trois cent")
        .putString(400, "quatre cent")
        .putString(500, "cinq cent")
        .putString(600, "six cent")
        .putString(700, "sept cent")
        .putString(800, "huit cent")
        .putString(900, "neuf cent")
        .putString(1000, "mille")
        .build();
  }

  @override
  List<PluralForms> pluralForms() {
    return [
      RegularPluralForms("", "", GenderType.MASCULINE),
      RegularPluralForms("mille", "mille", GenderType.MASCULINE),
      RegularPluralForms("million", "millions", GenderType.MASCULINE),
      RegularPluralForms("milliard", "milliards", GenderType.MASCULINE)
    ];
  }

  @override
  String currency() {
    return "€";
  }

  @override
  String twoDigitsNumberSeparator() {
    return '-';
  }

  Map<int, String> exceptions() {
    return {
      200: "deux cents",
      300: "trois cents",
      400: "quatre cents",
      500: "cinq cents",
      600: "six cents",
      700: "sept cents",
      800: "huit cents",
      900: "neuf cents",
      1000: "mille"
    };
  }
}
