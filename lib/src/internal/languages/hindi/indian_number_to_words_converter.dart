import 'package:sprintf/sprintf.dart';

import '../../converters/number_to_words_converter.dart';
import '../../support/assert.dart';
import '../../support/indian_number_chunking.dart';
import '../../support/number_chunking.dart';
import '../plural_forms.dart';

class IndianNumberToWordsConverter extends NumberToWordsConverter {
  @override
  final NumberChunking numberChunking = IndianNumberChunking();

  IndianNumberToWordsConverter(
      super.hundredsToWordsConverter, super.pluralForms);

  @override
  String? asWords(int value) {
    Assert.isTrue(value >= 0,
        () => sprintf("can't convert negative numbers for value %d", [value]));

    List<int> valueChunks = numberChunking.chunk(value);
    List<PluralForms> formsToUse =
        getRequiredFormsInReversedOrder(valueChunks.length);

    return joinValueChunksWithForms(valueChunks.iterator, formsToUse.iterator);
  }
}
