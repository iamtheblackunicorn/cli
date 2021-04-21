/*
CLI COMMAND-LINE API by Alexander Abraham a.k.a. The Black Unicorn
licensed under the MIT license
*/

/// This method returns a map
/// with a list of substrings matched.
/// The key is that by the name of
/// [patternName].
Map<String, List<String>> getPatterns(
    String patternName, String subject, RegExp regex) {
  Map<String, List<String>> result = {};
  Iterable<Match> matchObj = regex.allMatches(subject);
  List<String> imList = [];
  for (int i = 0; i < matchObj.length; i++) {
    Match myMatch = matchObj.elementAt(i);
    int actualLength = myMatch.groupCount + 1;
    for (int x = 0; x < actualLength; x++) {
      String subString = myMatch.group(x).toString();
      imList.add(subString);
    }
  }
  result.addAll({patternName: imList});
  return result;
}

void testRegex() {
  RegExp regex = RegExp(r'\"(.*)\"\s\=\>\s\"(.*)\"');
  String subject = '"name" => "hello"';
  String config = 'config';
  print(getPatterns(config, subject, regex));
}
