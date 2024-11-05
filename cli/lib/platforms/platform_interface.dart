import 'dart:io';

import 'package:cli/platforms/windows/windows.dart';

class PlatformInterface {
    platformChecking() {
    if (!Platform.isLinux) {
      windowsTerminal();
    }
    
  }
}
