import 'package:untitled1/src/tradukisto/internal/support/base_numbers_builder.dart';

import '../gender_forms.dart';
import '../gender_type.dart';
import '../plural_forms.dart';
import '../regular_plural_forms.dart';

class GermanValues {
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "null")
        .put(1,
            GenderForms.genderFormsNonApplicable("ein", "eine", "ein", "ein"))
        .putString(2, "zwei")
        .putString(3, "drei")
        .putString(4, "vier")
        .putString(5, "fünf")
        .putString(6, "sechs")
        .putString(7, "sieben")
        .putString(8, "acht")
        .putString(9, "neun")
        .putString(10, "zehn")
        .putString(11, "elf")
        .putString(12, "zwölf")
        .putString(13, "dreizehn")
        .putString(14, "vierzehn")
        .putString(15, "fünfzehn")
        .putString(16, "sechzehn")
        .putString(17, "siebzehn")
        .putString(18, "achtzehn")
        .putString(19, "neunzehn")
        .putString(20, "zwanzig")
        .putString(30, "dreißig")
        .putString(40, "vierzig")
        .putString(50, "fünfzig")
        .putString(60, "sechzig")
        .putString(70, "siebzig")
        .putString(80, "achtzig")
        .putString(90, "neunzig")
        .putString(100, "einhundert")
        .putString(200, "zweihundert")
        .putString(300, "dreihundert")
        .putString(400, "vierhundert")
        .putString(500, "fünfhundert")
        .putString(600, "sechshundert")
        .putString(700, "siebenhundert")
        .putString(800, "achthundert")
        .putString(900, "neunhundert")
        .build();
  }

  Map<int, String> exceptions() {
    return {1: "eins"};
  }

  List<PluralForms> pluralForms() {
    return [
      RegularPluralForms("Million", "Millionen", GenderType.FEMININE),
      RegularPluralForms("Milliarde", "Milliarden", GenderType.FEMININE)
    ];
  }

  String currency() {
    return "€";
  }
}
