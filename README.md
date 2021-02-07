# CLI :computer:

[![Build Status](https://travis-ci.com/iamtheblackunicorn/cli.svg?branch=main)](https://travis-ci.com/iamtheblackunicorn/cli)

*Making the writing of command-line apps in Dart intuitive. :computer:*

## About :books:

Some time ago, I wanted to make a command-line tool in Dart. This is when I noticed that I didn't have a clue about how to make a responsive and "classic" command-line app. *CLI* covers this need. it allows you to make command-line apps in the way you are used to from GNU programs. Flags like `--help` or `--version` are provided out of the box.

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
  clibu: ^1.0.0
```

The three dots represent anything else that you might have in the `dependencies` section. Having done that, re-fetch your project's dependencies by running this in the project's root directory:

```bash
$ dart pub get
```

## Usage :hammer:

### Importing

Import the main command-line API like this:

```dart
import 'package:clibu/clibu.dart';
```

### API

#### class CommandLineApp
Key command-line app class. The entire app lives in this class.

##### void addArgument(String argumentName, String helpMessage, bool isActive)
Adds an argument to your app!

##### void appHelpMessage()
"Batteries-included" app help text!
Prints help info about the app when the app
is invoked with `help`, `--help`, or `-h`.

##### void appInfoMessage()
"Batteries-included" app info text!
Prints info about the app when the app
is invoked with `info`, `--info`, or `-i`.

##### void appVersionMessage()
"Batteries-included" app version text!
Prints version info about the app when the app
is invoked with `version`, `--version`, or `-v`.

##### bool argumentWasUsed(List<String> arguments, String argument)
User method to check if an argument was used!

##### String getArgumentData(List<String> arguments, String argument)
User method to fetch the data of an argument!
This will only work if the `isActive` flag is `true`.

##### void runApp(List<String> arguments)
This method runs the app!
Batteries-included flags of `help`, `info`, and `version`.
  
## Example :calling:

This is what a minimal example using *CLI Black Unicorn* would look like.

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

## Note :scroll:

- *CLI* by Alexander Abraham a.k.a. *The Black Unicorn*
- licensed under the MIT license
