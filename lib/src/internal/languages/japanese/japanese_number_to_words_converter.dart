import 'package:sprintf/sprintf.dart';

import '../../converters/number_to_words_converter.dart';
import '../../support/assert.dart';
import '../../support/japanese_number_chunking.dart';
import '../../support/number_chunking.dart';
import '../plural_forms.dart';

class JapaneseNumberToWordsConverter extends NumberToWordsConverter {
  @override
  final NumberChunking numberChunking = JapaneseNumberChunking();

  JapaneseNumberToWordsConverter(hundredsToWordsConverter, pluralForms)
      : super.fromHundredsToWordsConverter(
            hundredsToWordsConverter, pluralForms);

  @override
  String? asWords(int value) {
    Assert.isTrue(value >= 0,
        () => sprintf("can't convert negative numbers for value %d", [value]));

    List<int> valueChunks = numberChunking.chunk(value);
    List<PluralForms> formsToUse =
        getRequiredFormsInReversedOrder(valueChunks.length);

    return joinValueChunksWithForms(valueChunks.iterator, formsToUse.iterator);
  }

  @override
  String? joinParts(List<String?> result) {
    return result.isEmpty
        ? hundredsToWordsConverter.asWords(0, pluralForms[0].getGenderType())
        : result.join("");
  }
}
