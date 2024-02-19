import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';
import 'package:numbers_to_words/src/internal/support/japanese_number_chunking.dart';

void main() {
  JapaneseNumberChunking japaneseNumberChunking = JapaneseNumberChunking();

  parameterizedTest(
    "should split number to three digit and 2 digit parts as per indian standards",
    [
      [
        123,
        [123]
      ],
      [
        1234,
        [1234]
      ],
      [
        123000789,
        [1, 2300, 789]
      ],
      [
        123456789,
        [1, 2345, 6789]
      ],
      [
        123000000,
        [1, 2300, 0000]
      ],
      [
        12300000,
        [1230, 0000]
      ],
      [
        9223372036854775807,
        [922, 3372, 368, 5477, 5807]
      ]
    ],
    p2((int number, List<int> chunks) {
      expect(japaneseNumberChunking.chunk(number), chunks);
    }),
  );
}
