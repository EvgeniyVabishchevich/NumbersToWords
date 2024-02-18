import '../../integer_to_string_converter.dart';
import '../../number_processor.dart';
import 'turkish_small_numbers_to_words_converter.dart';

class TurkishintToWordsConverter implements IntegerToStringConverter {
  final IntegerToStringConverter bigNumbersConverter;
  final TurkishSmallNumbersToWordsConverter smallNumbersConverter;

  TurkishintToWordsConverter(
      this.bigNumbersConverter, this.smallNumbersConverter);

  @override
  String? asWords(int value) {
    int bigNumber = (value / 1000000).floor();
    int smallNumber = value % 1000000;

    return NumberProcessor(bigNumbersConverter, smallNumbersConverter)
        .process(bigNumber, smallNumber);
  }
}
