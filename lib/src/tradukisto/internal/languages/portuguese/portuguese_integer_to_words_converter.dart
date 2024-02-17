import '../../integer_to_string_converter.dart';
import '../../multi_form_number.dart';
import '../../number_processor.dart';

class PortugueseIntegerToWordsConverter implements IntegerToStringConverter {
  final IntegerToStringConverter bigNumbersConverter;
  final Map<int, MultiFormNumber> exceptions;
  final IntegerToStringConverter smallNumbersConverter;

  PortugueseIntegerToWordsConverter(
      this.bigNumbersConverter, this.exceptions, this.smallNumbersConverter);

  @override
  String? asWords(int value) {
    if (exceptions.containsKey(value)) {
      return exceptions[value]?.getAloneForm();
    }

    int bigNumber = (value / 1000000).round();
    int smallNumber = value % 1000000;

    return NumberProcessor.withintConverter(
            bigNumbersConverter, smallNumbersConverter)
        .process(bigNumber, smallNumber);
  }
}
