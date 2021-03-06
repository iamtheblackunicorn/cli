/*
CLI COMMAND-LINE API by Alexander Abraham a.k.a. The Black Unicorn
licensed under the MIT license
*/

/// Key command-line app class.
/// The entire app lives in this class.
class CommandLineApp {
  late final String appName;
  late final String appVersion;
  late final String appAuthor;
  late final String appLicense;
  late final Map<String, dynamic> argumentsDataBase;

  /// Adds an argument to your app!
  void addArgument(String argumentName, String helpMessage, bool isActive) {
    List<dynamic> argumentData = [helpMessage, isActive];
    this.argumentsDataBase.putIfAbsent(argumentName, () => argumentData);
  }

  /// "Batteries-included" app help text!
  /// Prints help info about the app when the app
  /// is invoked with "help", "--help", or "-h".
  void appHelpMessage() {
    print('\n');
    for (String arg in this.argumentsDataBase.keys) {
      String argumentName = arg;
      String argumentHelpHint = this.argumentsDataBase[arg][0];
      String spaces = '  ';
      String message = '$argumentName$spaces$argumentHelpHint';
      print(message);
    }
    print('\n');
  }

  /// "Batteries-included" app info text!
  /// Prints info about the app when the app
  /// is invoked with "info", "--info", or "-i".
  void appInfoMessage() {
    String appName = this.appName;
    String appVersion = this.appVersion;
    String appAuthor = this.appAuthor;
    String appLicense = this.appLicense;
    String message =
        '\n$appName v.$appVersion\nby $appAuthor\nlicensed under the\n$appLicense\n';
    print(message);
  }

  /// "Batteries-included" app version text!
  /// Prints version info about the app when the app
  /// is invoked with "version", "--version", or "-v".
  void appVersionMessage() {
    String appName = this.appName;
    String appVersion = this.appVersion;
    String message = '\n$appName v.$appVersion\n';
    print(message);
  }

  /// User method to check if an argument was used!
  bool argumentWasUsed(List<String> arguments, String argument) {
    bool result = false;
    for (int i = 0; i < arguments.length; i++) {
      if (arguments[i] == argument) {
        result = true;
        break;
      } else {}
    }
    return result;
  }

  /// User method to fetch the data of an argument!
  /// This will only work if the "isActive" flag is "true".
  String getArgumentData(List<String> arguments, String argument) {
    String argumentData = '';
    for (int i = 0; i < arguments.length; i++) {
      if (arguments[i] == argument &&
          this.argumentsDataBase[argument][1] == true) {
        int dataIndex = i + 1;
        String argData = arguments[dataIndex];
        argumentData = argData;
        break;
      } else {}
    }
    return argumentData;
  }

  /// This method runs the app!
  /// Batteries-included flags of "help", "info", and "version".
  void runApp(List<String> arguments) {
    if (arguments[0] == 'help' ||
        arguments[0] == '--help' ||
        arguments[0] == '-h') {
      this.appHelpMessage();
    } else if (arguments[0] == 'info' ||
        arguments[0] == '--info' ||
        arguments[0] == '-i') {
      this.appInfoMessage();
    } else if (arguments[0] == 'version' ||
        arguments[0] == '--version' ||
        arguments[0] == '-v') {
      this.appVersionMessage();
    }
  }
}
