import 'gender_aware_integer_to_string_converter.dart';
import 'integer_to_string_converter.dart';
import 'languages/gender_type.dart';
import 'to_string_converter.dart';

class NumberProcessor {
  final IntegerToStringConverter bigNumbersConverter;
  late final GenderAwareIntegerToStringConverter smallNumbersConverter;

  NumberProcessor.withintConverter(this.bigNumbersConverter,
      IntegerToStringConverter smallNumbersConverter) {
    this.smallNumbersConverter =
        ToStringConverter.toGenderAwareInteger(smallNumbersConverter);
  }

  NumberProcessor(this.bigNumbersConverter, this.smallNumbersConverter);

  String? process(int bigNumber, int smallNumber) {
    List<String?> result = [];

    if (bigNumber > 0) {
      result.add(bigNumbersConverter.asWords(bigNumber));
    }

    if (smallNumber > 0) {
      result.add(smallNumbersConverter.asWords(
          smallNumber, GenderType.NON_APPLICABLE));
    }

    return merge(result);
  }

  String? merge(List<String?> result) {
    return result.isEmpty
        ? smallNumbersConverter.asWords(0, GenderType.NON_APPLICABLE)
        : result.join(" ");
  }
}
