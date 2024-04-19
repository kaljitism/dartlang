import 'dart:isolate';

import 'package:tooling_system_playground/tooling_system_playground.dart';

void main(List<String> arguments) {
  ReceivePort receivePort = ReceivePort();
  receivePort.listen((message) {
    if (message is String) {
      print(message);
    } else {
      print("Pi is $message");
      receivePort.close();
    }
  });

  Isolate.spawn(calculatePi, receivePort.sendPort);
}
