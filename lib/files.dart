/*
CLI File API by Alexander Abraham a.k.a. The Black Unicorn
licensed under the MIT license
*/

import 'dart:io';
import 'dart:convert';

/// Runs a shell command and prints the output
/// from STDERR and STDOUT.
void runCommand(String shellCommand) {
  List<String> shellItems = shellCommand.split(' ');
  String initItem = shellItems[0];
  shellItems.removeAt(0);
  Process.run(initItem, shellItems).then((result) {
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  });
}

/// Returns the contents of a file as a string.
String getFileContents(String filePath) {
  var fileContents = new File(filePath).readAsStringSync();
  return fileContents;
}

/// Returns a JSON string as a map.
Map<String, dynamic> getJSONMap(String jsonString) {
  Map<String, dynamic> jsonResult = json.decode(jsonString);
  return jsonResult;
}

/// Converts a Dart Map to a JSON string.
String mapToJSON(Map<String, dynamic> jsonData) {
  String stringResult = json.encode(jsonData);
  return stringResult;
}

/// Writes a string to a file.
void writeToFile(String filePath, String fileContents) {
  final File file = new File(filePath);
  file.writeAsStringSync(fileContents);
}

/// Checks whether a file exists.
bool fileExists(String filePath) {
  bool result = false;
  try {
    new File(filePath).readAsStringSync();
    result = true;
  } catch (e) {
    result = false;
  }
  return result;
}

/// A function to test all of the file functions.
void testFileFunctions() {
  String shellCommand = 'touch test.json';
  print('Test for the method "runCommand"!');
  runCommand(shellCommand);

  Map<String, dynamic> myData = {'name': 'Alex', 'age': '150'};

  String myJsonString = mapToJSON(myData);
  print('Test for the method "mapToJSON"!');
  print(myJsonString);

  Map<String, dynamic> myJsonMap = getJSONMap(myJsonString);
  print('Test for the method "getJSONMap"!');
  print(myJsonMap);

  print('Test for the method "writeToFile"!');
  writeToFile('test.json', myJsonString);

  print('Test for the method "getFileContents"!');
  print(getFileContents('test.json'));

  print('Test for the method "fileExists"!');
  print(fileExists('test.json'));
}
