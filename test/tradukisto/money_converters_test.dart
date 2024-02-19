import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';
import 'package:untitled1/src/tradukisto/internal/double_to_string_converter.dart';
import 'package:untitled1/src/tradukisto/money_converters.dart';

void main() {
  parameterizedTest("should convert number in language", [
    [MoneyConverters.AMERICAN_ENGLISH_BANKING_MONEY_VALUE.converter, "one thousand two hundred thirty-four \$ 56/100"],
    [MoneyConverters.BRAZILIAN_PORTUGUESE_BANKING_MONEY_VALUE.converter, "mil duzentos e trinta e quatro R\$ 56/100"],
    [MoneyConverters.BULGARIAN_BANKING_MONEY_VALUE.converter, "хиляда двеста тридесет четири лв 56/100"],
    [MoneyConverters.CZECH_BANKING_MONEY_VALUE.converter, "jeden tisíc dvě stě třicet čtyři Kč 56/100"],
    [MoneyConverters.DUTCH_BANKING_MONEY_VALUE.converter, "duizendtweehonderdvierendertig € 56/100"],
    [MoneyConverters.ENGLISH_BANKING_MONEY_VALUE.converter, "one thousand two hundred thirty-four £ 56/100"],
    [MoneyConverters.FRENCH_BANKING_MONEY_VALUE.converter, "mille deux cent trente-quatre € 56/100"],
    [MoneyConverters.GERMAN_BANKING_MONEY_VALUE.converter, "eintausendzweihundertvierunddreißig € 56/100"],
    [MoneyConverters.ITALIAN_BANKING_MONEY_VALUE.converter, "milleduecentotrentaquattro € 56/100"],
    [MoneyConverters.JAPANESE_BANKING_MONEY_VALUE.converter, "千二百三十四 円 56/100"],
    [MoneyConverters.KAZAKH_BANKING_MONEY_VALUE.converter, "бір мың екі жүз отыз төрт KZT 56/100"],
    [MoneyConverters.LATVIAN_BANKING_MONEY_VALUE.converter, "viens tūkstotis divi simti trīsdesmit četri EUR 56/100"],
    [MoneyConverters.POLISH_BANKING_MONEY_VALUE.converter, "jeden tysiąc dwieście trzydzieści cztery PLN 56/100"],
    [MoneyConverters.SERBIAN_CYRILLIC_BANKING_MONEY_VALUE.converter, "једна хиљада двеста тридесет четири РСД 56/100"],
    [MoneyConverters.SERBIAN_BANKING_MONEY_VALUE.converter, "jedna hiljada dvesta trideset četiri RSD 56/100"],
    [MoneyConverters.SLOVAK_BANKING_MONEY_VALUE.converter, "jeden tisíc dvesto tridsať štyri € 56/100"],
    [MoneyConverters.SLOVENE_BANKING_MONEY_VALUE.converter, "ena tisoč dvesto štiriintrideset € 56/100"],
    [MoneyConverters.SPANISH_BANKING_MONEY_VALUE.converter, "mil doscientos treinta y cuatro € 56/100"],
    [MoneyConverters.RUSSIAN_BANKING_MONEY_VALUE.converter, "одна тысяча двести тридцать четыре руб. 56/100"],
    [MoneyConverters.SWEDISH_BANKING_MONEY_VALUE.converter, "ett tusen två hundra och trettiofyra kr 56/100"],
    [MoneyConverters.TURKISH_BANKING_MONEY_VALUE.converter, "BinİkiYüzOtuzDörtTL,ElliAltıKr."],
    [MoneyConverters.UKRAINIAN_BANKING_MONEY_VALUE.converter, "одна тисяча двісті тридцять чотири ₴ 56/100"],
    [MoneyConverters.HINDI_BANKING_MONEY_VALUE.converter, "एक हजार दो सौ चौंतीस ₹,छप्पन p"],
  ], p2((DoubleToStringConverter converter, String result) {
    expect(converter.asWords(1234.56), result);
  }));

  test("should convert value with currency symbol provided", () {
    expect(MoneyConverters.RUSSIAN_BANKING_MONEY_VALUE.asWordsWithCurrencySymbol(1234.56, "EUR"),
    "одна тысяча двести тридцать четыре EUR 56/100");
  });
}