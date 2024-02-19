import 'gender_aware_integer_to_string_converter.dart';
import 'integer_to_string_converter.dart';

class ToStringConverter {
  static GenderAwareIntegerToStringConverter toGenderAwareInteger(
      final IntegerToStringConverter integerToStringConverter) {
    return GenderAwareIntegerToStringConverterImpl(integerToStringConverter);
  }
}
