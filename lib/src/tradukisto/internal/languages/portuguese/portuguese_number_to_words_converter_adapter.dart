import '../../converters/number_to_words_converter.dart';
import '../gender_type.dart';
import '../plural_forms.dart';

class PortugueseNumberToWordsConverterAdapter extends NumberToWordsConverter {
  PortugueseNumberToWordsConverterAdapter(hundredsToWordsConverter, pluralForms)
      : super.fromHundredsToWordsConverter(
            hundredsToWordsConverter, pluralForms);

  @override
  String? joinValueChunksWithForms(
      Iterator<int> chunks, Iterator<PluralForms> formsToUse) {
    List<String?> result = [];

    while (chunks.moveNext() && formsToUse.moveNext()) {
      int currentChunkValue = chunks.current;
      PluralForms currentForms = formsToUse.current;

      if (currentChunkValue > 0) {
        result.add(hundredsToWordsConverter.asWords(
            currentChunkValue, GenderType.NON_APPLICABLE));
        result.add(currentForms.formFor(currentChunkValue));
      }
    }

    return joinParts(result);
  }
}
