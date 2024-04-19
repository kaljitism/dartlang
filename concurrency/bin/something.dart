import 'dart:async';

void main() async {
  print("Program Starts");
  authEvent().then((value) => print(value));
  searchEvent().then((value) => print(value));
  print("Program Ends");
}

Future<String> authEvent() async => Future.value("Authorization Successful!");

Future<String> searchEvent() async => Future.value("6 Results found");
