import 'package:untitled1/src/tradukisto/internal/support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../gender_forms.dart';
import '../plural_forms.dart';
import 'turkish_plural_forms.dart';

class TurkishValues implements BaseValues {
  @override
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "Sıfır")
        .putString(1, "Bir")
        .putString(2, "İki")
        .putString(3, "Üç")
        .putString(4, "Dört")
        .putString(5, "Beş")
        .putString(6, "Altı")
        .putString(7, "Yedi")
        .putString(8, "Sekiz")
        .putString(9, "Dokuz")
        .putString(10, "On")
        .putString(11, "On Bir")
        .putString(12, "On İki")
        .putString(13, "On Üç")
        .putString(14, "On Dört")
        .putString(15, "On Beş")
        .putString(16, "On Altı")
        .putString(17, "On Yedi")
        .putString(18, "On Sekiz")
        .putString(19, "On Dokuz")
        .putString(20, "Yirmi")
        .putString(30, "Otuz")
        .putString(40, "Kırk")
        .putString(50, "Elli")
        .putString(60, "Altmış")
        .putString(70, "Yetmiş")
        .putString(80, "Seksen")
        .putString(90, "Doksan")
        .putString(100, "Yüz")
        .putString(200, "İki Yüz")
        .putString(300, "Üç Yüz")
        .putString(400, "Dört Yüz")
        .putString(500, "Beş Yüz")
        .putString(600, "Altı Yüz")
        .putString(700, "Yedi Yüz")
        .putString(800, "Sekiz Yüz")
        .putString(900, "Dokuz Yüz")
        .build();
  }

  @override
  List<PluralForms> pluralForms() {
    return [TurkishPluralForms("Milyon"), TurkishPluralForms("Milyar")];
  }

  @override
  String currency() {
    return "TL";
  }

  @override
  String twoDigitsNumberSeparator() {
    return ' ';
  }

  String subunitSymbol() {
    return "Kr.";
  }
}
