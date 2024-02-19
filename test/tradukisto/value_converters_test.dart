import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';
import 'package:untitled1/src/tradukisto/internal/double_to_string_converter.dart';
import 'package:untitled1/src/tradukisto/internal/integer_to_string_converter.dart';
import 'package:untitled1/src/tradukisto/money_converters.dart';
import 'package:untitled1/src/tradukisto/value_converters.dart';

void main() {
  parameterizedTest("should convert number in language", [
    [ValueConverters.BRAZILIAN_PORTUGUESE_INTEGER.converter, "mil duzentos e trinta e quatro"],
    [ValueConverters.BULGARIAN_INTEGER.converter, "хиляда двеста тридесет четири"],
    [ValueConverters.CZECH_INTEGER.converter, "jeden tisíc dvě stě třicet čtyři"],
    [ValueConverters.DUTCH_INTEGER.converter, "duizendtweehonderdvierendertig"],
    [ValueConverters.ENGLISH_INTEGER.converter, "one thousand two hundred thirty-four"],
    [ValueConverters.FRENCH_INTEGER.converter, "mille deux cent trente-quatre"],
    [ValueConverters.GERMAN_INTEGER.converter, "eintausendzweihundertvierunddreißig"],
    [ValueConverters.ITALIAN_INTEGER.converter, "milleduecentotrentaquattro"],
    [ValueConverters.JAPANESE_INTEGER.converter, "千二百三十四"],
    [ValueConverters.KAZAKH_INTEGER.converter, "бір мың екі жүз отыз төрт"],
    [ValueConverters.LATVIAN_INTEGER.converter, "viens tūkstotis divi simti trīsdesmit četri"],
    [ValueConverters.POLISH_INTEGER.converter, "jeden tysiąc dwieście trzydzieści cztery"],
    [ValueConverters.SERBIAN_CYRILLIC_INTEGER.converter, "једна хиљада двеста тридесет четири"],
    [ValueConverters.SPANISH_INTEGER.converter, "mil doscientos treinta y cuatro"],
    [ValueConverters.SLOVAK_INTEGER.converter, "jeden tisíc dvesto tridsať štyri"],
    [ValueConverters.SPANISH_INTEGER.converter, "mil doscientos treinta y cuatro"],
    [ValueConverters.SLOVENE_INTEGER.converter, "ena tisoč dvesto štiriintrideset"],
    [ValueConverters.RUSSIAN_INTEGER.converter, "одна тысяча двести тридцать четыре"],
    [ValueConverters.SWEDISH_INTEGER.converter, "ett tusen två hundra och trettiofyra"],
    [ValueConverters.TURKISH_INTEGER.converter, "Bin İki Yüz Otuz Dört"],
    [ValueConverters.UKRAINIAN_INTEGER.converter, "одна тисяча двісті тридцять чотири"],
    [ValueConverters.HINDI_INTEGER.converter, "एक हजार दो सौ चौंतीस"],
  ], p2((IntegerToStringConverter converter, String result) {
    expect(converter.asWords(1234), result);
  }));

  parameterizedTest("should return converter for language code", [
    [ValueConverters.BRAZILIAN_PORTUGUESE_INTEGER, "pt-br"],
    [ValueConverters.BRAZILIAN_PORTUGUESE_INTEGER, "pt"],
    [ValueConverters.BULGARIAN_INTEGER, "bg"],
    [ValueConverters.CZECH_INTEGER, "cs"],
    [ValueConverters.DUTCH_INTEGER, "nl"],
    [ValueConverters.ENGLISH_INTEGER, "en"],
    [ValueConverters.FRENCH_INTEGER, "fr"],
    [ValueConverters.GERMAN_INTEGER, "de"],
    [ValueConverters.ITALIAN_INTEGER, "it"],
    [ValueConverters.JAPANESE_INTEGER, "ja"],
    [ValueConverters.KAZAKH_INTEGER, "kk"],
    [ValueConverters.LATVIAN_INTEGER, "lv"],
    [ValueConverters.POLISH_INTEGER, "pl"],
    [ValueConverters.SERBIAN_CYRILLIC_INTEGER, "sr__#Cyrl"],
    [ValueConverters.SPANISH_INTEGER, "es"],
    [ValueConverters.SLOVAK_INTEGER, "sk"],
    [ValueConverters.SLOVENE_INTEGER, "sl"],
    [ValueConverters.RUSSIAN_INTEGER, "ru"],
    [ValueConverters.SWEDISH_INTEGER, "sv"],
    [ValueConverters.TURKISH_INTEGER, "tr"],
    [ValueConverters.UKRAINIAN_INTEGER, "uk"],
    [ValueConverters.HINDI_INTEGER, "hi"],
  ], p2((ValueConverters converter, String code) {
    expect(ValueConverters.getByLanguageCodeOrDefault(code, ValueConverters.ENGLISH_INTEGER), converter);
  }));

  test("should return supplied default converter when languageCode is unknown", () {
    expect(ValueConverters.getByLanguageCodeOrDefault("wrong code", ValueConverters.FRENCH_INTEGER), ValueConverters.FRENCH_INTEGER);
  });
}