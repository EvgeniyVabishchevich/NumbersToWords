import 'package:numbers_to_words/src/internal/support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../english/english_plural_forms.dart';
import '../gender_forms.dart';
import '../plural_forms.dart';

class HindiValues implements BaseValues {
  @override
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "शून्य")
        .putString(1, "एक")
        .putString(2, "दो")
        .putString(3, "तीन")
        .putString(4, "चार")
        .putString(5, "पाँच")
        .putString(6, "छ:")
        .putString(7, "सात")
        .putString(8, "आठ")
        .putString(9, "नौ")
        .putString(10, "दस")
        .putString(11, "ग्यारह")
        .putString(12, "बारह")
        .putString(13, "तेरह")
        .putString(14, "चौदह")
        .putString(15, "पंद्रह")
        .putString(16, "सोलह")
        .putString(17, "सत्रह")
        .putString(18, "आट्ठारह")
        .putString(19, "उन्नीस")
        .putString(20, "बीस")
        .putString(21, "इक्कीस")
        .putString(22, "बाईस")
        .putString(23, "तेईस")
        .putString(24, "चौबीस")
        .putString(25, "पच्चीस")
        .putString(26, "छब्बीस")
        .putString(27, "सत्ताईस")
        .putString(28, "अट्ठाईस")
        .putString(29, "उनतीस")
        .putString(30, "तीस")
        .putString(31, "इकत्तीस")
        .putString(32, "बत्तीस")
        .putString(33, "तेंतीस")
        .putString(34, "चौंतीस")
        .putString(35, "पैंतीस")
        .putString(36, "छत्तीस")
        .putString(37, "सैंतीस")
        .putString(38, "अड़तीस")
        .putString(39, "उनतालीस")
        .putString(40, "चालीस")
        .putString(41, "एकतालीस")
        .putString(42, "बायलीस")
        .putString(43, "तैंतालीस")
        .putString(44, "चौवालीस")
        .putString(45, "पैंतालिस")
        .putString(46, "छियालीस")
        .putString(47, "सैंतालीस")
        .putString(48, "अड़तालीस")
        .putString(49, "उनचास")
        .putString(50, "पचास")
        .putString(51, "इक्यबन")
        .putString(52, "बावन")
        .putString(53, "तिरपन")
        .putString(54, "चौवन")
        .putString(55, "पचपन")
        .putString(56, "छप्पन")
        .putString(57, "सत्तावन")
        .putString(58, "अट्ठावन")
        .putString(59, "उनसठ")
        .putString(60, "साठ")
        .putString(61, "इकसठ")
        .putString(62, "बासठ")
        .putString(63, "तिरसठ")
        .putString(64, "चौंसठ")
        .putString(65, "पैंसठ")
        .putString(66, "छियासठ")
        .putString(67, "सड़सठ")
        .putString(68, "सड़सठ")
        .putString(69, "उनहत्तर")
        .putString(70, "सत्तर")
        .putString(71, "इकहत्तर")
        .putString(72, "बहत्तर")
        .putString(73, "तिहत्तर")
        .putString(74, "चौहत्तर")
        .putString(75, "पचहत्तर")
        .putString(76, "छीहत्तर")
        .putString(77, "सतहत्तर")
        .putString(78, "अठहत्तर")
        .putString(79, "उनासी")
        .putString(80, "असी")
        .putString(81, "इक्यासी")
        .putString(82, "बयासी")
        .putString(83, "तिरासी")
        .putString(84, "चौरासी")
        .putString(85, "पचासी")
        .putString(86, "छियासी")
        .putString(87, "सतासी")
        .putString(88, "अट्ठासी")
        .putString(89, "नवासी")
        .putString(90, "नब्बे")
        .putString(91, "इक्यानवे")
        .putString(92, "बानवे")
        .putString(93, "तिरानवे")
        .putString(94, "चौरानवे")
        .putString(95, "पचानवे")
        .putString(96, "छियानवे")
        .putString(97, "सतानवे")
        .putString(98, "अट्ठानवे")
        .putString(99, "निन्यानवे")
        .putString(100, "एक सौ")
        .putString(200, "दो सौ")
        .putString(300, "तीन सौ")
        .putString(400, "चार सौ")
        .putString(500, "पाँच सौ")
        .putString(600, "छ: सौ")
        .putString(700, "सात सौ")
        .putString(800, "आठ सौ")
        .putString(900, "नौ सौ")
        .build();
  }

  @override
  List<PluralForms> pluralForms() {
    return [
      EnglishPluralForms(""),
      EnglishPluralForms("हजार"),
      EnglishPluralForms("लाख"),
      EnglishPluralForms("करोड़"),
      EnglishPluralForms("अरब"),
      EnglishPluralForms("खरब"),
      EnglishPluralForms("नील"),
      EnglishPluralForms("पद्म"),
      EnglishPluralForms("शंख"),
      EnglishPluralForms("महाशंख")
    ];
  }

  @override
  String currency() {
    return "₹";
  }

  @override
  String twoDigitsNumberSeparator() {
    return '';
  }

  String paiseSymbol() {
    return "p";
  }
}
