import 'package:cli/platforms/linux/linux.dart';

class functions {
  Future<void> autoCopyFunc() async {
    linuxTerminal().autoCopy();
  }
}
