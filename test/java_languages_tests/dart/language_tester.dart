import 'dart:io';

import 'package:numbers_to_words/src/internal/integer_to_string_converter.dart';
import 'package:numbers_to_words/src/internal/long_to_string_converter.dart';
import 'package:numbers_to_words/src/internal/container.dart';
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
        case LANGUAGE.bulgarian:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.bulgarianContainer().getIntegerConverter()));
        case LANGUAGE.croatian:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.croatianContainer().getIntegerConverter()));
        case LANGUAGE.czech:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.czechContainer().getIntegerConverter()));
        case LANGUAGE.dutch:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.dutchContainer().getIntegerConverter()));
        case LANGUAGE.english:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.englishContainer().getIntegerConverter()));
        case LANGUAGE.french:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.frenchContainer().getIntegerConverter()));
        case LANGUAGE.german:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.germanContainer().getIntegerConverter()));
        case LANGUAGE.hindi:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.hindiContainer().getIntegerConverter()));
        case LANGUAGE.italian:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.italianContainer().getIntegerConverter()));
        case LANGUAGE.japanese:
          stdout.writeln(returnWordsFromInt(numbers,
              Container.japaneseKanjiContainer().getIntegerConverter()));
        case LANGUAGE.kazakh:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.kazakhContainer().getIntegerConverter()));
        case LANGUAGE.latvian:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.latvianContainer().getIntegerConverter()));
        case LANGUAGE.polish:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.polishContainer().getIntegerConverter()));
        case LANGUAGE.portuguese:
          stdout.writeln(returnWordsFromInt(numbers,
              Container.brazilianPortugueseContainer().getIntegerConverter()));
        case LANGUAGE.russian:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.russianContainer().getIntegerConverter()));
        case LANGUAGE.serbian:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.serbianContainer().getIntegerConverter()));
        case LANGUAGE.slovak:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.slovakContainer().getIntegerConverter()));
        case LANGUAGE.slovene:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.sloveneContainer().getIntegerConverter()));
        case LANGUAGE.spanish:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.spanishContainer().getIntegerConverter()));
        case LANGUAGE.swedish:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.swedishContainer().getIntegerConverter()));
        case LANGUAGE.turkish:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.turkishContainer().getIntegerConverter()));
        case LANGUAGE.ukrainian:
          stdout.writeln(returnWordsFromInt(
              numbers, Container.ukrainianContainer().getIntegerConverter()));
      }
    } else {
      switch (language) {
        case LANGUAGE.croatian:
          stdout.writeln(returnWordsFromLong(
              numbers, Container.croatianContainer().getLongConverter()!));
        case LANGUAGE.english:
          stdout.writeln(returnWordsFromLong(
              numbers, Container.englishContainer().getLongConverter()!));
        case LANGUAGE.hindi:
          stdout.writeln(returnWordsFromLong(
              numbers, Container.hindiContainer().getLongConverter()!));
        case LANGUAGE.japanese:
          stdout.writeln(returnWordsFromLong(
              numbers, Container.japaneseKanjiContainer().getLongConverter()!));
        case LANGUAGE.polish:
          stdout.writeln(returnWordsFromLong(
              numbers, Container.polishContainer().getLongConverter()!));
        case LANGUAGE.slovene:
          stdout.writeln(returnWordsFromLong(
              numbers, Container.sloveneContainer().getLongConverter()!));
        case LANGUAGE.swedish:
          stdout.writeln(returnWordsFromLong(
              numbers, Container.swedishContainer().getLongConverter()!));
        default:
          throw ArgumentError("Wrong language for long type");
      }
    }
  }

  String returnWordsFromInt(
      List<int> numbers, IntegerToStringConverter integerToStringConverter) {
    return numbers
        .map((e) => integerToStringConverter.asWords(e))
        .toList()
        .join(", ");
  }

  String returnWordsFromLong(
      List<int> numbers, LongToStringConverter longToStringConverter) {
    return numbers
        .map((e) => longToStringConverter.asWords(e))
        .toList()
        .join(", ");
  }
}
