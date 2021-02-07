/*
CLI by Alexander Abraham a.k.a. The Black Unicorn
licensed under the MIT license
*/

import 'package:clibu/clibu.dart';

// Inherits from the original class,
// "CommandLineApp".
class TestApp extends CommandLineApp {
  @override
  String appName = 'Test';
  @override
  String appVersion = '1.0';
  @override
  String appAuthor = 'The Black Unicorn';
  @override
  String appLicense = 'MIT license';
  @override
  Map<String, dynamic> argumentsDataBase = {};
}

// Function to execute when the option
// is called.
void greet(String name) {
  String greeting = 'Hello, $name!';
  print(greeting);
}

// Main entry point for the Dart VM.
void main(List<String> arguments) {
  TestApp myApp = TestApp();
  myApp.addArgument('--greet', 'greets the user with a specified name', true);
  if (myApp.argumentWasUsed(arguments, '--greet') == true) {
    greet(myApp.getArgumentData(arguments, '--greet'));
  }
  myApp.runApp(arguments); // finally running the app
}
