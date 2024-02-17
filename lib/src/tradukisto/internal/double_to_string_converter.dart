abstract interface class DoubleToStringConverter {
  String asWords(double value);

  String asWordsWithSymbol(double value, String currencySymbol);
}
