import 'dart:io';

import 'language_tester.dart';

void main() {
  try {
    while(true) {
      String command = stdin.readLineSync()!;

      List<String> commandArgs = command.split(" ");

      switch (getGoal(commandArgs)) {
        case 'languages':
          LanguageTester().test(commandArgs);
      }
    }
  } on Exception catch(e) {
    stdout.writeln(e.toString());
  }
}

String getGoal(List<String> commandArgs) {
  String goal = commandArgs.first;
  commandArgs.removeAt(0);
  return goal;
}
