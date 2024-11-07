final class Cli {
  Future<void> _findCommand() async {
    print('test');
  }

  Future<void> handle(List<String> args) async {
    await _findCommand();
  }
}
