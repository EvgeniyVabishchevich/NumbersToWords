import '../../gender_aware_integer_to_string_converter.dart';
import '../../integer_to_string_converter.dart';
import '../../number_processor.dart';

class ItalianIntegerToWordsConverter implements IntegerToStringConverter {
  final IntegerToStringConverter bigNumbersConverter;
  final Map<int, String> exceptions;
  final GenderAwareIntegerToStringConverter smallNumbersConverter;

  ItalianIntegerToWordsConverter(
      this.bigNumbersConverter, this.exceptions, this.smallNumbersConverter);

  @override
  String? asWords(int value) {
    if (exceptions.containsKey(value)) {
      return exceptions[value];
    }

    int bigNumber = (value / 1000000).floor();
    int smallNumber = value % 1000000;

    return NumberProcessor(bigNumbersConverter, smallNumbersConverter)
        .process(bigNumber, smallNumber)
        ?.replaceAll(" ", "");
  }
}
