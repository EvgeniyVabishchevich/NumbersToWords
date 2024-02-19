import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';
import 'package:untitled1/src/tradukisto/internal/long_to_string_converter.dart';
import 'package:untitled1/src/tradukisto/long_value_converters.dart';

void main() {
  parameterizedTest("should convert number in language", [
    [LongValueConverters.ENGLISH_LONG.converter, "one quintillion"],
    [LongValueConverters.POLISH_LONG.converter, "jeden trylion"],
    [LongValueConverters.HINDI_LONG.converter, "दस शंख"],
    [LongValueConverters.SWEDISH_LONG.converter, "en triljon"],
    [LongValueConverters.JAPANESE_KANJI_LONG.converter, "百京"]
  ], p2((LongToStringConverter converter, String result) {
    expect(converter.asWords(1000000000000000000), result);
  }));
}