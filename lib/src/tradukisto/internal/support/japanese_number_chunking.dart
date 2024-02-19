import 'number_chunking.dart';

class JapaneseNumberChunking extends NumberChunking {
  static final int JAPANESE_SPLIT_FACTOR = 10000;

  @override
  List<int> chunk(int value) {
    final result = <int>[];

    while (value > 0) {
      result.insert(0, value % JAPANESE_SPLIT_FACTOR);
      value = (value ~/ JAPANESE_SPLIT_FACTOR).floor();
    }

    return result;
  }
}
