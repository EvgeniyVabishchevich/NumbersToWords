import 'package:test/test.dart';
import 'package:numbers_to_words/src/internal/languages/dutch/dutch_thousand_to_words_converter.dart';
import 'package:numbers_to_words/src/internal/languages/gender_forms.dart';
import 'package:numbers_to_words/src/internal/languages/gender_type.dart';

void main() {
  test("should convert value from list of base values", () {
    DutchThousandToWordsConverter converter =
        DutchThousandToWordsConverter({1: GenderForms.genderForm("één")});

    expect(converter.asWords(1, GenderType.NON_APPLICABLE), "één");
  });

  test("should convert two digits number", () {
    DutchThousandToWordsConverter converter = DutchThousandToWordsConverter({
      20: GenderForms.genderForm("twintig"),
      1: GenderForms.genderForm("één")
    });

    expect(converter.asWords(21, GenderType.NON_APPLICABLE), "éénentwintig");
  });

  test("should convert three digits number", () {
    DutchThousandToWordsConverter converter =
        DutchThousandToWordsConverter({
          600: GenderForms.genderForm("zeshonderd"),
          60: GenderForms.genderForm("zestig"),
          6: GenderForms.genderForm("zes")
        });

    expect(converter.asWords(666, GenderType.NON_APPLICABLE), "zeshonderdzesenzestig");
  });

  test("should convert more that three digits number", () {
    DutchThousandToWordsConverter converter =
    DutchThousandToWordsConverter({
      600: GenderForms.genderForm("zeshonderd"),
      60: GenderForms.genderForm("zestig"),
      6: GenderForms.genderForm("zes")
    });

    expect(converter.asWords(66666, GenderType.NON_APPLICABLE), "zesenzestigduizendzeshonderdzesenzestig");
  });

  test("should convert value from list of base values", () {
    DutchThousandToWordsConverter converter =
    DutchThousandToWordsConverter({1: GenderForms.genderForm("één")});

    expect(() => converter.asWords(2, GenderType.NON_APPLICABLE), throwsArgumentError);
  });
}
