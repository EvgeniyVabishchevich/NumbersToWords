import 'package:sprintf/sprintf.dart';
import 'package:numbers_to_words/src/internal/long_to_string_converter.dart';

import '../gender_aware_integer_to_string_converter.dart';
import '../integer_to_string_converter.dart';
import '../languages/plural_forms.dart';
import '../support/assert.dart';
import '../support/number_chunking.dart';
import '../to_string_converter.dart';

class NumberToWordsConverter
    implements IntegerToStringConverter, LongToStringConverter {
  final NumberChunking numberChunking = NumberChunking();

  late final GenderAwareIntegerToStringConverter hundredsToWordsConverter;
  final List<PluralForms> pluralForms;

  NumberToWordsConverter(this.hundredsToWordsConverter, this.pluralForms);

  NumberToWordsConverter.fromHundredsToWordsConverter(
      final IntegerToStringConverter hundredsToWordsConverter,
      this.pluralForms) {
    this.hundredsToWordsConverter =
        ToStringConverter.toGenderAwareInteger(hundredsToWordsConverter);
  }

  @override
  String? asWords(int value) {
    Assert.isTrue(value >= 0,
        () => sprintf("can't convert negative numbers for value %d", [value]));

    List<int> valueChunks = numberChunking.chunk(value);
    List<PluralForms> formsToUse =
        getRequiredFormsInReversedOrder(valueChunks.length);

    return joinValueChunksWithForms(valueChunks.iterator, formsToUse.iterator);
  }

  List<PluralForms> getRequiredFormsInReversedOrder(int chunks) {
    List<PluralForms> formsToUse = List.of(pluralForms.sublist(0, chunks));
    formsToUse = formsToUse.reversed.toList();
    return formsToUse;
  }

  String? joinValueChunksWithForms(
      Iterator<int> chunks, Iterator<PluralForms> formsToUse) {
    List<String?> result = [];

    while (chunks.moveNext() && formsToUse.moveNext()) {
      int currentChunkValue = chunks.current;
      PluralForms currentForms = formsToUse.current;

      if (currentChunkValue > 0) {
        result.add(hundredsToWordsConverter.asWords(
            currentChunkValue, currentForms.getGenderType()));
        result.add(currentForms.formFor(currentChunkValue));
      }
    }

    return joinParts(result);
  }

  String? joinParts(List<String?> result) {
    return result.isEmpty
        ? hundredsToWordsConverter.asWords(
            0, pluralForms.elementAt(0).getGenderType())
        : result.join(" ").trim();
  }
}
