# CLI :computer:

[![GitHub CI](https://github.com/iamtheblackunicorn/cli/actions/workflows/dart.yml/badge.svg)](https://github.com/iamtheblackunicorn/cli/actions)

*Making the writing of command-line apps in Dart intuitive. :computer:*

## About :books:

Some time ago, I wanted to make a command-line tool in Dart. This is when I noticed that I didn't have a clue about how to make a responsive and "classic" command-line app. *CLI* covers this need. It allows you to make command-line apps in the way you are used to from GNU programs. Flags like `--help` or `--version` are provided out of the box.

## Installation :inbox_tray:

### Adding to your project

To add *CLI* to your project's dependencies, add this line to your project's `pubspec.yaml`:

#### From *GitHub*

```YAML
depdencies:
  ...
  clibu:
    git: git://github.com/iamtheblackunicorn/cli.git
```

#### From *Pub.dev*

```YAML
depdencies:
  ...
  clibu: ^1.5.0
```

The three dots represent anything else that you might have in the `dependencies` section. Having done that, re-fetch your project's dependencies by running this in the project's root directory:

```bash
$ dart pub get
```

## Usage :hammer:

### Importing

Import the API like this:

```dart
import 'package:clibu/clibu.dart';
```

## Example :calling:

This is what a minimal example using *CLI Black Unicorn* would look like.

```dart
/*
CLI Black Unicorn by Alexander Abraham a.k.a. The Black Unicorn
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

## Note :scroll:

- *CLI :computer:* by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- Licensed under the MIT license.

