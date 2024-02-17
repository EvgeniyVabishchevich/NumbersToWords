class NumberChunking {
  static final int SPLIT_FACTOR = 1000;

  List<int> chunk(int value) {
    final result = <int>[];

    while (value > 0) {
      result.insert(0, value % SPLIT_FACTOR);
      value = (value / SPLIT_FACTOR).round();
    }

    return result;
  }
}
