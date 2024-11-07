import 'package:args/args.dart';

void main(List<String> args) {
  final parser = ArgParser();

  parser.addFlag("test", abbr: "t");
  var test = parser.parse(args);
  print(test["test"]);
}
