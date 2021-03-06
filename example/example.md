# EXAMPLE FOR CLI

## Example `pubspec.yaml`

Here is the example's `pubspec.yaml`:
```YAML
name: test
description: A test app for CLI!
version: 1.0.0
publish_to: none
homepage: https://github.com/iamtheblackunicorn/cli
environment:
  sdk: '>=2.12.0 <3.0.0'
dependencies:
  clibu:
    git: git://github.com/iamtheblackunicorn/cli.git
```

## Example app

This is what an example command-line app would look like for CLI:

```dart
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
```
