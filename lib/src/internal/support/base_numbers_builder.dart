import 'dart:collection';

import '../languages/gender_forms.dart';

class BaseNumbersBuilder {
  final Map<int, GenderForms> result = HashMap();

  static BaseNumbersBuilder baseNumbersBuilder() {
    return BaseNumbersBuilder();
  }

  BaseNumbersBuilder put(int number, GenderForms forms) {
    if (result.containsKey(number)) {
      throw NumberAlreadyMappedException(number);
    }
    result[number] = forms;
    return this;
  }

  BaseNumbersBuilder putString(int number, String form) {
    if (result.containsKey(number)) {
      throw NumberAlreadyMappedException(number);
    }
    result[number] = GenderForms.genderForm(form);
    return this;
  }

  Map<int, GenderForms> build() {
    return result;
  }
}

class NumberAlreadyMappedException implements Exception {
  late final String cause;

  NumberAlreadyMappedException(int number) {
    cause = "Number $number already mapped";
  }
}
