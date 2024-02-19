import 'package:numbers_to_words/src/internal/support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../gender_forms.dart';
import '../plural_forms.dart';
import 'kazakh_plural_forms.dart';

class KazakhValues implements BaseValues {
  @override
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "нөл")
        .putString(1, "бір")
        .putString(2, "екі")
        .putString(3, "үш")
        .putString(4, "төрт")
        .putString(5, "бес")
        .putString(6, "алты")
        .putString(7, "жеті")
        .putString(8, "сегіз")
        .putString(9, "тоғыз")
        .putString(10, "он")
        .putString(11, "он бір")
        .putString(12, "он екі")
        .putString(13, "он үш")
        .putString(14, "он төрт")
        .putString(15, "он бес")
        .putString(16, "он алты")
        .putString(17, "он жеті")
        .putString(18, "он сегіз")
        .putString(19, "он тоғыз")
        .putString(20, "жиырма")
        .putString(30, "отыз")
        .putString(40, "қырық")
        .putString(50, "елу")
        .putString(60, "алпыс")
        .putString(70, "жетпіс")
        .putString(80, "сексен")
        .putString(90, "тоқсан")
        .putString(100, "жүз")
        .putString(200, "екі жүз")
        .putString(300, "үш жүз")
        .putString(400, "төрт жүз")
        .putString(500, "бес жүз")
        .putString(600, "алты жүз")
        .putString(700, "жеті жүз")
        .putString(800, "сегіз жүз")
        .putString(900, "тоғыз жүз")
        .build();
  }

  @override
  List<PluralForms> pluralForms() {
    return [
      KazakhPluralForms(""),
      KazakhPluralForms("мың"),
      KazakhPluralForms("миллион"),
      KazakhPluralForms("миллиард")
    ];
  }

  @override
  String currency() {
    return "KZT";
  }

  @override
  String twoDigitsNumberSeparator() {
    return ' ';
  }
}
