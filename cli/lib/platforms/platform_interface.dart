import 'dart:io';

import 'package:cli/platforms/linux/linux.dart';
import 'package:cli/platforms/windows/windows.dart';

class PlatformInterface {
  platformChecking() {
    print('PlatformCheking is good');
    if (!Platform.isLinux) {
      windowsTerminal();
      print('Is Windows');
    }
    print('Is Linux');
    linuxTerminal().autoCopy();
  }
}
