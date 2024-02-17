import 'package:untitled1/src/tradukisto/internal/languages/gender_type.dart';

abstract interface class PluralForms {
  String formFor(int value);

  GenderType getGenderType();
}
