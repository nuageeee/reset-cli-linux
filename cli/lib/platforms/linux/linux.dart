import 'package:os/os.dart';

void linuxPlatform() {
  final os = OperatingSystem.current;
  print('Operating system: $os');
}