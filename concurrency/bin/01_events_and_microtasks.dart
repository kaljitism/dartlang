import 'dart:async';

void main() async {
  print("Program Starts");

  scheduleMicrotask(() => print("Microtask Detected"));

  print(await future());

  print(await authEvent());
  print(await searchEvent());

  print("Program Ends");
}

Future<String> future() async {
  Completer<String> completer = Completer();

  Future.delayed(
    Duration(seconds: 2),
    () => completer.complete("Delayed Call"),
  );

  return completer.future;
}

Future<String> authEvent() async => Future.value("Authorization Successful!");

Future<String> searchEvent() async => Future.value("6 Results found");
