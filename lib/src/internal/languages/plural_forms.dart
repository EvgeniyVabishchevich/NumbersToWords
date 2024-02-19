import 'package:numbers_to_words/src/internal/languages/gender_type.dart';

abstract interface class PluralForms {
  String formFor(int value);

  GenderType getGenderType();
}
