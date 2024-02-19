import 'package:sprintf/sprintf.dart';

import '../../converters/number_to_words_converter.dart';
import '../../support/range.dart';

class FrenchNumberToWordsConverter extends NumberToWordsConverter {
  final Map<int, String> exceptions;

  FrenchNumberToWordsConverter(
      hundredsToWordsConverter, this.exceptions, pluralForms)
      : super.fromHundredsToWordsConverter(
            hundredsToWordsConverter, pluralForms);

  @override
  String? asWords(int value) {
    if (exceptions.containsKey(value)) {
      return exceptions[value];
    }
    if (Range.closed(1000, 999999).contains(value)) {
      return thousandsAsString(value);
    }
    return super.asWords(value);
  }

  String thousandsAsString(int value) {
    int thousands = (value / 1000).floor();
    int other = value % 1000;

    if (isOneThousand(thousands)) {
      return getOneThousandAsWords(other);
    }

    return getThousandsAsWords(thousands, other);
  }

  String getThousandsAsWords(int thousands, int other) {
    if (nothingComesAfter(other)) {
      return sprintf("%s mille", [asWords(thousands)]);
    }
    return sprintf("%s mille %s", [asWords(thousands), asWords(other)]);
  }

  String getOneThousandAsWords(int other) {
    return sprintf("mille %s", [asWords(other)]);
  }

  bool nothingComesAfter(int other) {
    return other == 0;
  }

  bool isOneThousand(int thousands) {
    return thousands == 1;
  }
}
