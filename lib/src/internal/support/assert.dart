class Assert {
  static void isFalse(bool condition) {
    if (condition) {
      throw ArgumentError();
    }
  }

  static void isTrue(bool condition, String Function() errorMsg) {
    if (!condition) {
      throw ArgumentError(errorMsg());
    }
  }
}
