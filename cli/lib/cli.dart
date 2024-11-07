import 'package:cli/platforms/platform_interface.dart';

final class Cli {
  Future<void> handle() async {
      PlatformInterface().platformChecking();
  }
}
