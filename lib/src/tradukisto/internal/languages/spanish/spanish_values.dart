import 'package:untitled1/src/tradukisto/internal/support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../../multi_form_number.dart';
import '../gender_forms.dart';
import '../plural_forms.dart';
import '../regular_plural_forms.dart';

class SpanishValues implements BaseValues {
  @override
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "cero")
        .put(1, GenderForms.genderForms("uno", "una", "un"))
        .putString(2, "dos")
        .putString(3, "tres")
        .putString(4, "cuatro")
        .putString(5, "cinco")
        .putString(6, "seis")
        .putString(7, "siete")
        .putString(8, "ocho")
        .putString(9, "nueve")
        .putString(10, "diez")
        .putString(11, "once")
        .putString(12, "doce")
        .putString(13, "trece")
        .putString(14, "catorce")
        .putString(15, "quince")
        .putString(16, "dieciséis")
        .putString(17, "diecisiete")
        .putString(18, "dieciocho")
        .putString(19, "diecinueve")
        .putString(20, "veinte")
        .put(21, GenderForms.genderForms("veintiuno", "veintiuna", "veintiun"))
        .putString(22, "veintidós")
        .putString(23, "veintitrés")
        .putString(24, "veinticuatro")
        .putString(25, "veinticinco")
        .putString(26, "veintiséis")
        .putString(27, "veintisiete")
        .putString(28, "veintiocho")
        .putString(29, "veintinueve")
        .putString(30, "treinta")
        .putString(40, "cuarenta")
        .putString(50, "cincuenta")
        .putString(60, "sesenta")
        .putString(70, "setenta")
        .putString(80, "ochenta")
        .putString(90, "noventa")
        .put(200,
            GenderForms.genderForms("doscientos", "doscientas", "doscientos"))
        .put(
            300,
            GenderForms.genderForms(
                "trescientos", "trescientas", "trescientos"))
        .put(
            400,
            GenderForms.genderForms(
                "cuatrocientos", "cuatrocientas", "cuatrocientos"))
        .put(500,
            GenderForms.genderForms("quinientos", "quinientas", "quinientos"))
        .put(
            600,
            GenderForms.genderForms(
                "seiscientos", "seiscientas", "seiscientos"))
        .put(
            700,
            GenderForms.genderForms(
                "setecientos", "setecientas", "setecientos"))
        .put(
            800,
            GenderForms.genderForms(
                "ochocientos", "ochocientas", "ochocientos"))
        .put(
            900,
            GenderForms.genderForms(
                "novecientos", "novecientas", "novecientos"))
        .build();
  }

  @override
  List<PluralForms> pluralForms() {
    return [
      RegularPluralForms.nonApplicable("millón", "millones"),
      RegularPluralForms.nonApplicable("mil millones", "mil millones")
    ];
  }

  @override
  String currency() {
    return "€";
  }

  @override
  String twoDigitsNumberSeparator() {
    return ' ';
  }

  Map<int, MultiFormNumber> exceptions() {
    return {
      100: MultiFormNumber("cien", "ciento"),
      100000000: MultiFormNumber("cien millones", "ciento millones")
    };
  }
}
