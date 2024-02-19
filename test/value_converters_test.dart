import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';
import 'package:numbers_to_words/src/internal/integer_to_string_converter.dart';
import 'package:numbers_to_words/src/value_converters.dart';

void main() {
  parameterizedTest("should convert number in language", [
    [ValueConverters.brazilianPortuguese.converter, "mil duzentos e trinta e quatro"],
    [ValueConverters.bulgarian.converter, "хиляда двеста тридесет четири"],
    [ValueConverters.czech.converter, "jeden tisíc dvě stě třicet čtyři"],
    [ValueConverters.dutch.converter, "duizendtweehonderdvierendertig"],
    [ValueConverters.english.converter, "one thousand two hundred thirty-four"],
    [ValueConverters.french.converter, "mille deux cent trente-quatre"],
    [ValueConverters.german.converter, "eintausendzweihundertvierunddreißig"],
    [ValueConverters.italian.converter, "milleduecentotrentaquattro"],
    [ValueConverters.japanese.converter, "千二百三十四"],
    [ValueConverters.kazakh.converter, "бір мың екі жүз отыз төрт"],
    [ValueConverters.latvian.converter, "viens tūkstotis divi simti trīsdesmit četri"],
    [ValueConverters.polish.converter, "jeden tysiąc dwieście trzydzieści cztery"],
    [ValueConverters.serbianCyrillic.converter, "једна хиљада двеста тридесет четири"],
    [ValueConverters.spanish.converter, "mil doscientos treinta y cuatro"],
    [ValueConverters.slovak.converter, "jeden tisíc dvesto tridsať štyri"],
    [ValueConverters.spanish.converter, "mil doscientos treinta y cuatro"],
    [ValueConverters.slovene.converter, "ena tisoč dvesto štiriintrideset"],
    [ValueConverters.russian.converter, "одна тысяча двести тридцать четыре"],
    [ValueConverters.swedish.converter, "ett tusen två hundra och trettiofyra"],
    [ValueConverters.turkish.converter, "Bin İki Yüz Otuz Dört"],
    [ValueConverters.ukrainian.converter, "одна тисяча двісті тридцять чотири"],
    [ValueConverters.hindi.converter, "एक हजार दो सौ चौंतीस"],
  ], p2((IntegerToStringConverter converter, String result) {
    expect(converter.asWords(1234), result);
  }));

  parameterizedTest("should return converter for language code", [
    [ValueConverters.brazilianPortuguese, "pt-br"],
    [ValueConverters.brazilianPortuguese, "pt"],
    [ValueConverters.bulgarian, "bg"],
    [ValueConverters.czech, "cs"],
    [ValueConverters.dutch, "nl"],
    [ValueConverters.english, "en"],
    [ValueConverters.french, "fr"],
    [ValueConverters.german, "de"],
    [ValueConverters.italian, "it"],
    [ValueConverters.japanese, "ja"],
    [ValueConverters.kazakh, "kk"],
    [ValueConverters.latvian, "lv"],
    [ValueConverters.polish, "pl"],
    [ValueConverters.serbianCyrillic, "sr__#Cyrl"],
    [ValueConverters.spanish, "es"],
    [ValueConverters.slovak, "sk"],
    [ValueConverters.slovene, "sl"],
    [ValueConverters.russian, "ru"],
    [ValueConverters.swedish, "sv"],
    [ValueConverters.turkish, "tr"],
    [ValueConverters.ukrainian, "uk"],
    [ValueConverters.hindi, "hi"],
  ], p2((ValueConverters converter, String code) {
    expect(ValueConverters.getByLanguageCodeOrDefault(code, ValueConverters.english), converter);
  }));

  test("should return supplied default converter when languageCode is unknown", () {
    expect(ValueConverters.getByLanguageCodeOrDefault("wrong code", ValueConverters.french), ValueConverters.french);
  });
}