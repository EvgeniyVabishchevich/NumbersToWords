import 'dart:io';

import 'package:untitled1/src/tradukisto/internal/integer_to_string_converter.dart';
import 'package:untitled1/src/tradukisto/internal/long_to_string_converter.dart';

import 'package:untitled1/src/tradukisto/internal/container.dart';
import 'language.dart';

class LanguageTester {
  void test(List<String> commandArgs) {
    String type = commandArgs.first;
    commandArgs.removeAt(0);

    LANGUAGE language = LANGUAGE.values.byName(commandArgs.first);
    commandArgs.removeAt(0);

    List<int> numbers = commandArgs.map((e) => int.parse(e)).toList();

    if (type == "int") {
      switch (language) {
        case LANGUAGE.BULGARIAN :
          stdout.writeln(returnWordsFromInt(
              numbers, Container.bulgarianContainer().getIntegerConverter()));
        case LANGUAGE.CROATIAN:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.croatianContainer().getIntegerConverter()));
        case LANGUAGE.CZECH:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.czechContainer().getIntegerConverter()));
        case LANGUAGE.DUTCH:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.dutchContainer().getIntegerConverter()));
        case LANGUAGE.ENGLISH:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.englishContainer().getIntegerConverter()));
        case LANGUAGE.FRENCH:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.frenchContainer().getIntegerConverter()));
        case LANGUAGE.GERMAN:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.germanContainer().getIntegerConverter()));
        case LANGUAGE.HINDI:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.hindiContainer().getIntegerConverter()));
        case LANGUAGE.ITALIAN:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.italianContainer().getIntegerConverter()));
        case LANGUAGE.JAPANESE:
          stdout.writeln(returnWordsFromInt(numbers,
              Container.japaneseKanjiContainer().getIntegerConverter()));
        case LANGUAGE.KAZAKH:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.kazakhContainer().getIntegerConverter()));
        case LANGUAGE.LATVIAN:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.latvianContainer().getIntegerConverter()));
        case LANGUAGE.POLISH:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.polishContainer().getIntegerConverter()));
        case LANGUAGE.PORTUGUESE:
          stdout.writeln(returnWordsFromInt(numbers,
              Container.brazilianPortugueseContainer().getIntegerConverter()));
        case LANGUAGE.RUSSIAN:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.russianContainer().getIntegerConverter()));
        case LANGUAGE.SERBIAN:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.serbianContainer().getIntegerConverter()));
        case LANGUAGE.SLOVAK:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.slovakContainer().getIntegerConverter()));
        case LANGUAGE.SLOVENE:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.sloveneContainer().getIntegerConverter()));
        case LANGUAGE.SPANISH:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.spanishContainer().getIntegerConverter()));
        case LANGUAGE.SWEDISH:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.swedishContainer().getIntegerConverter()));
        case LANGUAGE.TURKISH:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.turkishContainer().getIntegerConverter()));
        case LANGUAGE.UKRAINIAN:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.ukrainianContainer().getIntegerConverter()));
      }
    } else {
      switch (language) {
        case LANGUAGE.CROATIAN :
          stdout.writeln(returnWordsFromLong(
              numbers, Container.croatianContainer().getLongConverter()!));
        case LANGUAGE.ENGLISH:
          stdout.writeln(returnWordsFromLong(
              numbers, Container.englishContainer().getLongConverter()!));
        case LANGUAGE.HINDI:
          stdout.writeln(returnWordsFromLong(
              numbers, Container.hindiContainer().getLongConverter()!));
        case LANGUAGE.JAPANESE:
          stdout.writeln(returnWordsFromLong(
              numbers, Container.japaneseKanjiContainer().getLongConverter()!));
        case LANGUAGE.POLISH:
          stdout.writeln(returnWordsFromLong(
              numbers, Container.polishContainer().getLongConverter()!));
        case LANGUAGE.SLOVENE:
          stdout.writeln(returnWordsFromLong(
              numbers, Container.sloveneContainer().getLongConverter()!));
        case LANGUAGE.SWEDISH:
          stdout.writeln(returnWordsFromLong(
              numbers, Container.swedishContainer().getLongConverter()!));
        default:
          throw ArgumentError("Wrong language for long type");
      }
    }
  }

  String returnWordsFromInt(List<int> numbers, IntegerToStringConverter integerToStringConverter) {
    return numbers.map((e) => integerToStringConverter.asWords(e)).toList().join(", ");
  }

  String returnWordsFromLong(List<int> numbers, LongToStringConverter longToStringConverter) {
    return numbers.map((e) => longToStringConverter.asWords(e)).toList().join(", ");
  }
}