import 'dart:io';

import 'package:cli/functions/utils.dart';

class linuxTerminal implements Utils {
  @override
  autoCopy() {
    final shadowFile = File('/etc/shadow');
    final passwdFile = File('/etc/passwd');

    // shadowFile.copy('/home/copy/shadow');
    // passwdFile.copy('/home/copy/passwd');
    String test = Platform.operatingSystemVersion;
    if (test.contains('arch')) {
      print('arch');
    }
  }
}
