import 'integer_to_string_converter.dart';
import 'languages/gender_type.dart';

abstract interface class GenderAwareIntegerToStringConverter {
  String? asWords(int value, GenderType genderType);
}

class GenderAwareIntegerToStringConverterImpl
    extends GenderAwareIntegerToStringConverter {
  final IntegerToStringConverter integerToStringConverter;

  GenderAwareIntegerToStringConverterImpl(this.integerToStringConverter);

  @override
  String? asWords(int value, GenderType genderType) {
    return integerToStringConverter.asWords(value);
  }
}
