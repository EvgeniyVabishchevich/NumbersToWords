import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';
import 'package:numbers_to_words/src/internal/support/indian_number_chunking.dart';

void main() {
  IndianNumberChunking indianNumberChunking = IndianNumberChunking();

  parameterizedTest(
    "should split number to three digit and 2 digit parts as per indian standards",
    [
      [
        123,
        [123]
      ],
      [
        1234,
        [1, 234]
      ],
      [
        123000789,
        [12, 30, 0, 789]
      ],
      [
        123456789,
        [12, 34, 56, 789]
      ],
      [
        123000000,
        [12, 30, 0, 0]
      ],
      [
        12300000,
        [1, 23, 0, 0]
      ],
      [
        9223372036854775807,
        [92, 23, 37, 20, 36, 85, 47, 75, 807]
      ]
    ],
    p2((int number, List<int> chunks) {
      expect(indianNumberChunking.chunk(number), chunks);
    }),
  );
}
