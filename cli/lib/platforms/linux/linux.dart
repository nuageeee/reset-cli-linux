import 'dart:io';

import 'package:cli/components/utils.dart';

class linuxTerminal {
  @override

  Future<void> handle() async {
    final osFile = File('/etc/os-release');
    osFile.readAsString().then((String cts) {
      if (cts.contains('arch') & cts.contains('20240721')) {}
    });
  }
}