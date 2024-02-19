class DoubleScaleGetter {
  static int getScale(double value) {
    String numberAsString = value.toString();

    if (!numberAsString.contains('.')) {
      return 0;
    }

    int decimalIndex = numberAsString.indexOf('.');

    int count = numberAsString.length - decimalIndex - 1;

    return count;
  }
}
