import 'package:sprintf/sprintf.dart';

import '../../converters/hundreds_to_words_converter.dart';
import '../../converters/number_to_words_converter.dart';

class BulgarianIntegerToWordsConverter extends NumberToWordsConverter {
  final String oneThousand;

  static final String MERGE_PATTERN = "%s %s";
  static final int ONE_THOUSAND = 1000;
  static final int TWO_THOUSAND = 2000;

  BulgarianIntegerToWordsConverter(
      HundredsToWordsConverter super.hundredsToStringConverter,
      super.pluralForms,
      this.oneThousand);

  @override
  String? asWords(int value) {
    if (value == ONE_THOUSAND) {
      return oneThousand;
    }

    if (isBetweenOneThousandAndTwoThousand(value)) {
      int remainder = getNumbersSmallerThanOneThousand(value);
      return sprintf(MERGE_PATTERN, [oneThousand, super.asWords(remainder)]);
    } else {
      return super.asWords(value);
    }
  }

  bool isBetweenOneThousandAndTwoThousand(int value) {
    return value >= ONE_THOUSAND && value < TWO_THOUSAND;
  }

  int getNumbersSmallerThanOneThousand(int values) {
    return values % ONE_THOUSAND;
  }
}
