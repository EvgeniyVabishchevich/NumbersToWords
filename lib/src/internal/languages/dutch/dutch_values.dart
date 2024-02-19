import 'package:numbers_to_words/src/internal/support/base_numbers_builder.dart';

import '../gender_forms.dart';
import '../plural_forms.dart';
import 'dutch_plural_forms.dart';

class DutchValues {
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "nul")
        .putString(1, "één")
        .putString(2, "twee")
        .putString(3, "drie")
        .putString(4, "vier")
        .putString(5, "vijf")
        .putString(6, "zes")
        .putString(7, "zeven")
        .putString(8, "acht")
        .putString(9, "negen")
        .putString(10, "tien")
        .putString(11, "elf")
        .putString(12, "twaalf")
        .putString(13, "dertien")
        .putString(14, "veertien")
        .putString(15, "vijftien")
        .putString(16, "zestien")
        .putString(17, "zeventien")
        .putString(18, "achttien")
        .putString(19, "negentien")
        .putString(20, "twintig")
        .putString(30, "dertig")
        .putString(40, "veertig")
        .putString(50, "vijftig")
        .putString(60, "zestig")
        .putString(70, "zeventig")
        .putString(80, "tachtig")
        .putString(90, "negentig")
        .putString(100, "honderd")
        .putString(200, "tweehonderd")
        .putString(300, "driehonderd")
        .putString(400, "vierhonderd")
        .putString(500, "vijfhonderd")
        .putString(600, "zeshonderd")
        .putString(700, "zevenhonderd")
        .putString(800, "achthonderd")
        .putString(900, "negenhonderd")
        .build();
  }

  Map<int, String> exceptions() {
    return {1000: "duizend"};
  }

  List<PluralForms> pluralForms() {
    return [DutchPluralForms("miljoen"), DutchPluralForms("miljard")];
  }

  String currency() {
    return "€";
  }
}
