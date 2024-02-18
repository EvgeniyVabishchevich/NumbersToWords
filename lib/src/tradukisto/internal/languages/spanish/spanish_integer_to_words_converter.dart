import '../../integer_to_string_converter.dart';
import '../../multi_form_number.dart';
import '../../number_processor.dart';

class SpanishIntegerToWordsConverter implements IntegerToStringConverter {
  final IntegerToStringConverter bigNumbersConverter;
  final Map<int, MultiFormNumber> exceptions;
  final IntegerToStringConverter smallNumbersConverter;

  SpanishIntegerToWordsConverter(
      this.bigNumbersConverter, this.exceptions, this.smallNumbersConverter);

  @override
  String? asWords(int value) {
    if (exceptions.containsKey(value)) {
      return exceptions[value]?.getAloneForm();
    }

    int bigNumber = (value / 1000000).floor();
    int smallNumber = value % 1000000;

    String? numberProcessor = NumberProcessor.withintConverter(
            bigNumbersConverter, smallNumbersConverter)
        .process(bigNumber, smallNumber);

    if (value.toString().endsWith("1") && !value.toString().endsWith("11")) {
      numberProcessor = ("${numberProcessor}o");
    }
    if (value == 1000000000) {
      numberProcessor = "mil millones";
    }
    if (value > 1000000000) {
      numberProcessor = numberProcessor?.replaceAll("un mil millones", "mil");
    }
    if (value == 2000000000) {
      numberProcessor = "dos mil millones";
    }
    if (value > 2000000000) {
      numberProcessor = numberProcessor
          ?.replaceAll("un millón", "un millones")
          .replaceAll("dos mil millones", "dos mil");
    }
    return numberProcessor;
  }
}
