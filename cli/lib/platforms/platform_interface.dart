import 'dart:io';

import 'package:cli/platforms/linux/linux.dart';
import 'package:cli/platforms/windows/windows.dart';

class PlatformInterface {
  platformChecking() {
    if (!Platform.isLinux) {
      windowsTerminal();
    }
    linuxTerminal().autoCopy();
  }
}
