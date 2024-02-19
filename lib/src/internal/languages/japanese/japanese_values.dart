import 'package:numbers_to_words/src/internal/support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../gender_forms.dart';
import '../plural_forms.dart';
import 'japanese_plural_forms.dart';

class JapaneseValues implements BaseValues {
  @override
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "零")
        .putString(1, "一")
        .putString(2, "二")
        .putString(3, "三")
        .putString(4, "四")
        .putString(5, "五")
        .putString(6, "六")
        .putString(7, "七")
        .putString(8, "八")
        .putString(9, "九")
        .putString(10, "十")
        .putString(20, "二十")
        .putString(30, "三十")
        .putString(40, "四十")
        .putString(50, "五十")
        .putString(60, "六十")
        .putString(70, "七十")
        .putString(80, "八十")
        .putString(90, "九十")
        .putString(100, "百")
        .putString(200, "二百")
        .putString(300, "三百")
        .putString(400, "四百")
        .putString(500, "五百")
        .putString(600, "六百")
        .putString(700, "七百")
        .putString(800, "八百")
        .putString(900, "九百")
        .putString(1000, "千")
        .putString(2000, "二千")
        .putString(3000, "三千")
        .putString(4000, "四千")
        .putString(5000, "五千")
        .putString(6000, "六千")
        .putString(7000, "七千")
        .putString(8000, "八千")
        .putString(9000, "九千")
        .build();
  }

  @override
  List<PluralForms> pluralForms() {
    return [
      JapanesePluralForms(""),
      JapanesePluralForms("万"),
      JapanesePluralForms("億"),
      JapanesePluralForms("兆"),
      JapanesePluralForms("京")
    ];
  }

  @override
  String currency() {
    return "円";
  }

  @override
  String twoDigitsNumberSeparator() {
    return ' ';
  }
}
