import 'dart:io';

import 'package:cli/functions/utils.dart';

class linuxTerminal implements Utils {
  @override
  void autoCopy() {
    final shadowFile = File('/etc/shadow');
    final passwdFile = File('/etc/passwd');

    // shadowFile.copy('/home/copy/shadow');
    // passwdFile.copy('/home/copy/passwd');
    print(Platform.operatingSystemVersion);
  }
}
