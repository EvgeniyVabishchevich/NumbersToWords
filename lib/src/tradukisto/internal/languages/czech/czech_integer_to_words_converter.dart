import '../../integer_to_string_converter.dart';
import '../../number_processor.dart';

class CzechIntegerToWordsConverter implements IntegerToStringConverter {
  final IntegerToStringConverter bigNumbersConverter;
  final IntegerToStringConverter smallNumbersConverter;
  final Map<int, String> exceptions;

  CzechIntegerToWordsConverter(
      this.bigNumbersConverter, this.smallNumbersConverter, this.exceptions);

  @override
  String? asWords(int value) {
    if (exceptions.containsKey(value)) {
      return exceptions[value];
    }

    int bigNumber = (value / 1000).round();
    int smallNumber = value % 1000;

    return NumberProcessor.withintConverter(
            bigNumbersConverter, smallNumbersConverter)
        .process(bigNumber, smallNumber);
  }
}
