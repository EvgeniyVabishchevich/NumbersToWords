import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';
import 'package:numbers_to_words/src/internal/long_to_string_converter.dart';
import 'package:numbers_to_words/src/long_value_converters.dart';

void main() {
  parameterizedTest("should convert number in language", [
    [LongValueConverters.english.converter, "one quintillion"],
    [LongValueConverters.polish.converter, "jeden trylion"],
    [LongValueConverters.hindi.converter, "दस शंख"],
    [LongValueConverters.swedish.converter, "en triljon"],
    [LongValueConverters.japaneseKanji.converter, "百京"]
  ], p2((LongToStringConverter converter, String result) {
    expect(converter.asWords(1000000000000000000), result);
  }));
}