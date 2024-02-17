import 'package:untitled1/src/tradukisto/internal/support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../gender_forms.dart';
import '../gender_type.dart';
import '../plural_forms.dart';
import '../slavic_plural_forms.dart';

class RussianValues implements BaseValues {
  @override
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "ноль")
        .put(1, GenderForms.genderForms("один", "одна", "один"))
        .put(2, GenderForms.genderForms("два", "две", "два"))
        .putString(3, "три")
        .putString(4, "четыре")
        .putString(5, "пять")
        .putString(6, "шесть")
        .putString(7, "семь")
        .putString(8, "восемь")
        .putString(9, "девять")
        .putString(10, "десять")
        .putString(11, "одиннадцать")
        .putString(12, "двенадцать")
        .putString(13, "тринадцать")
        .putString(14, "четырнадцать")
        .putString(15, "пятнадцать")
        .putString(16, "шестнадцать")
        .putString(17, "семнадцать")
        .putString(18, "восемнадцать")
        .putString(19, "девятнадцать")
        .putString(20, "двадцать")
        .putString(30, "тридцать")
        .putString(40, "сорок")
        .putString(50, "пятьдесят")
        .putString(60, "шестьдесят")
        .putString(70, "семьдесят")
        .putString(80, "восемьдесят")
        .putString(90, "девяносто")
        .putString(100, "сто")
        .putString(200, "двести")
        .putString(300, "триста")
        .putString(400, "четыреста")
        .putString(500, "пятьсот")
        .putString(600, "шестьсот")
        .putString(700, "семьсот")
        .putString(800, "восемьсот")
        .putString(900, "девятьсот")
        .build();
  }

  @override
  List<PluralForms> pluralForms() {
    return [
      SlavicPluralForms("", "", "", GenderType.MASCULINE),
      SlavicPluralForms("тысяча", "тысячи", "тысяч", GenderType.FEMININE),
      SlavicPluralForms(
          "миллион", "миллиона", "миллионов", GenderType.MASCULINE),
      SlavicPluralForms(
          "миллиард", "миллиарда", "миллиардов", GenderType.MASCULINE)
    ];
  }

  @override
  String currency() {
    return "руб.";
  }

  @override
  String twoDigitsNumberSeparator() {
    return ' ';
  }
}
