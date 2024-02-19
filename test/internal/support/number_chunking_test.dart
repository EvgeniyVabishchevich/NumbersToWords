import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';
import 'package:numbers_to_words/src/internal/support/number_chunking.dart';

void main() {
  NumberChunking numberChunking = NumberChunking();

  parameterizedTest("should split number to three digit and 2 digit parts as per indian standards",
    [
      [123, [123]],
      [1234, [1, 234]],
      [123000789, [123, 0, 789]],
      [123456789, [123, 456, 789]],
      [123000000, [123, 0, 0]],
      [12300000, [12, 300, 0]],
      [9223372036854775807, [9, 223, 372, 36, 854, 775, 807]]
    ], p2((int number, List<int> chunks) {
      expect(numberChunking.chunk(number), chunks);
    }),
  );
}