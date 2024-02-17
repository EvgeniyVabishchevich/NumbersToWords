import 'package:untitled1/src/tradukisto/internal/support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../gender_forms.dart';
import '../plural_forms.dart';
import 'polish_plural_forms.dart';

class PolishValues implements BaseValues {
  @override
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "zero")
        .putString(1, "jeden")
        .putString(2, "dwa")
        .putString(3, "trzy")
        .putString(4, "cztery")
        .putString(5, "pięć")
        .putString(6, "sześć")
        .putString(7, "siedem")
        .putString(8, "osiem")
        .putString(9, "dziewięć")
        .putString(10, "dziesięć")
        .putString(11, "jedenaście")
        .putString(12, "dwanaście")
        .putString(13, "trzynaście")
        .putString(14, "czternaście")
        .putString(15, "piętnaście")
        .putString(16, "szesnaście")
        .putString(17, "siedemnaście")
        .putString(18, "osiemnaście")
        .putString(19, "dziewiętnaście")
        .putString(20, "dwadzieścia")
        .putString(30, "trzydzieści")
        .putString(40, "czterdzieści")
        .putString(50, "pięćdziesiąt")
        .putString(60, "sześćdziesiąt")
        .putString(70, "siedemdziesiąt")
        .putString(80, "osiemdziesiąt")
        .putString(90, "dziewięćdziesiąt")
        .putString(100, "sto")
        .putString(200, "dwieście")
        .putString(300, "trzysta")
        .putString(400, "czterysta")
        .putString(500, "pięćset")
        .putString(600, "sześćset")
        .putString(700, "siedemset")
        .putString(800, "osiemset")
        .putString(900, "dziewięćset")
        .build();
  }

  @override
  List<PluralForms> pluralForms() {
    return [
      PolishPluralForms.NonApplicable("", "", ""),
      PolishPluralForms.NonApplicable("tysiąc", "tysiące", "tysięcy"),
      PolishPluralForms.NonApplicable("milion", "miliony", "milionów"),
      PolishPluralForms.NonApplicable("miliard", "miliardy", "miliardów"),
      PolishPluralForms.NonApplicable("bilion", "biliony", "bilionów"),
      PolishPluralForms.NonApplicable("biliard", "biliardy", "biliardów"),
      PolishPluralForms.NonApplicable("trylion", "tryliony", "trylionów")
    ];
  }

  @override
  String currency() {
    return "PLN";
  }

  @override
  String twoDigitsNumberSeparator() {
    return ' ';
  }
}
