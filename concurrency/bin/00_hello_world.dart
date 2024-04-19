import 'dart:async';

void main() async {
  print("Program Starts");
  print(await future());
  print("Program Ends");
}

Future future() async {
  Completer completer = Completer();

  Future.delayed(
    Duration(seconds: 2),
    () => completer.complete("Hello World!"),
  );

  return completer.future;
}
