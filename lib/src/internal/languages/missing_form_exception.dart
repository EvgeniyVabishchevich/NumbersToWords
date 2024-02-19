class MissingFormException implements Exception {
  String cause;

  MissingFormException(this.cause);
}
