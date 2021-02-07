# EXAMPLE FOR CLI

## Example `pubspec.yaml`

Here is the example's `pubspec.yaml`:

Here is the example's `pubspec.yaml`:
```YAML
name: test
description: A test app for CLI!
version: 1.0.0
homepage: https://github.com/iamtheblackunicorn/cli
environment:
  sdk: '>=2.10.0 <3.0.0'
dependencies:
  cli:
    git: git://github.com/iamtheblackunicorn/cli.git
dev_dependencies:
  cli:
    git: git://github.com/iamtheblackunicorn/cli.git
```

## Example app

This is what an example command-line app would look like for CLI:

```dart
/*
CLI by Alexander Abraham a.k.a. The Black Unicorn
licensed under the MIT license
*/

import 'package:cli/cli.dart';

class TestApp extends CommandLineApp{
  @override
  String appName = 'Test';
  @override
  String appVersion = '1.0';
  @override
  String appAuthor = 'The Black Unicorn';
  @override
  String appLicense = 'MIT license';
}

void greet(String name){
  String greeting = 'Hello, $name!';
  print(greeting);
}

void main(List<String> arguments){
  TestApp myApp = TestApp();
  myApp.addArgument('--greet', 'greets the user with a specified name', true);
  if(myApp.argumentWasUsed(arguments, '--greet') == true){
    greet(myApp.getArgumentData(arguments,'--greet'));
  }
  else {
    print('Invalid options provided!\nTry the "--help" flag!');
  }
  myApp.runApp(arguments);
}
```
