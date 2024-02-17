import 'package:untitled1/src/tradukisto/internal/support/base_numbers_builder.dart';

import '../../multi_form_number.dart';
import '../gender_forms.dart';
import '../plural_forms.dart';
import '../regular_plural_forms.dart';

class BrazilianPortugueseValues {
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "zero")
        .putString(1, "um")
        .putString(2, "dois")
        .putString(3, "três")
        .putString(4, "quatro")
        .putString(5, "cinco")
        .putString(6, "seis")
        .putString(7, "sete")
        .putString(8, "oito")
        .putString(9, "nove")
        .putString(10, "dez")
        .putString(11, "onze")
        .putString(12, "doze")
        .putString(13, "treze")
        .putString(14, "catorze")
        .putString(15, "quinze")
        .putString(16, "dezesseis")
        .putString(17, "dezessete")
        .putString(18, "dezoito")
        .putString(19, "dezenove")
        .putString(20, "vinte")
        .putString(30, "trinta")
        .putString(40, "quarenta")
        .putString(50, "cinquenta")
        .putString(60, "sessenta")
        .putString(70, "setenta")
        .putString(80, "oitenta")
        .putString(90, "noventa")
        .putString(200, "duzentos")
        .putString(300, "trezentos")
        .putString(400, "quatrocentos")
        .putString(500, "quinhentos")
        .putString(600, "seiscentos")
        .putString(700, "setecentos")
        .putString(800, "oitocentos")
        .putString(900, "novecentos")
        .build();
  }

  Map<int, MultiFormNumber> exceptions() {
    return {100: MultiFormNumber("cem", "cento")};
  }

  List<PluralForms> pluralForms() {
    return [
      RegularPluralForms.nonApplicable("milhão", "milhões"),
      RegularPluralForms.nonApplicable("bilhão", "bilhões")
    ];
  }

  String currency() {
    return "R\$";
  }
}
