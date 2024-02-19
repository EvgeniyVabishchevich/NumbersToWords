import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';
import 'package:numbers_to_words/src/internal/double_to_string_converter.dart';
import 'package:numbers_to_words/src/money_converters.dart';

void main() {
  parameterizedTest("should convert number in language", [
    [MoneyConverters.americanEnglish.converter, "one thousand two hundred thirty-four \$ 56/100"],
    [MoneyConverters.brazilianPortuguese.converter, "mil duzentos e trinta e quatro R\$ 56/100"],
    [MoneyConverters.bulgarian.converter, "хиляда двеста тридесет четири лв 56/100"],
    [MoneyConverters.czech.converter, "jeden tisíc dvě stě třicet čtyři Kč 56/100"],
    [MoneyConverters.dutch.converter, "duizendtweehonderdvierendertig € 56/100"],
    [MoneyConverters.english.converter, "one thousand two hundred thirty-four £ 56/100"],
    [MoneyConverters.french.converter, "mille deux cent trente-quatre € 56/100"],
    [MoneyConverters.german.converter, "eintausendzweihundertvierunddreißig € 56/100"],
    [MoneyConverters.italian.converter, "milleduecentotrentaquattro € 56/100"],
    [MoneyConverters.japanese.converter, "千二百三十四 円 56/100"],
    [MoneyConverters.kazakh.converter, "бір мың екі жүз отыз төрт KZT 56/100"],
    [MoneyConverters.latvian.converter, "viens tūkstotis divi simti trīsdesmit četri EUR 56/100"],
    [MoneyConverters.polish.converter, "jeden tysiąc dwieście trzydzieści cztery PLN 56/100"],
    [MoneyConverters.serbianCyrillic.converter, "једна хиљада двеста тридесет четири РСД 56/100"],
    [MoneyConverters.serbian.converter, "jedna hiljada dvesta trideset četiri RSD 56/100"],
    [MoneyConverters.slovak.converter, "jeden tisíc dvesto tridsať štyri € 56/100"],
    [MoneyConverters.slovene.converter, "ena tisoč dvesto štiriintrideset € 56/100"],
    [MoneyConverters.spanish.converter, "mil doscientos treinta y cuatro € 56/100"],
    [MoneyConverters.russian.converter, "одна тысяча двести тридцать четыре руб. 56/100"],
    [MoneyConverters.swedish.converter, "ett tusen två hundra och trettiofyra kr 56/100"],
    [MoneyConverters.turkish.converter, "BinİkiYüzOtuzDörtTL,ElliAltıKr."],
    [MoneyConverters.ukrainian.converter, "одна тисяча двісті тридцять чотири ₴ 56/100"],
    [MoneyConverters.hindi.converter, "एक हजार दो सौ चौंतीस ₹,छप्पन p"],
  ], p2((DoubleToStringConverter converter, String result) {
    expect(converter.asWords(1234.56), result);
  }));

  test("should convert value with currency symbol provided", () {
    expect(MoneyConverters.russian.asWordsWithCurrencySymbol(1234.56, "EUR"),
    "одна тысяча двести тридцать четыре EUR 56/100");
  });
}