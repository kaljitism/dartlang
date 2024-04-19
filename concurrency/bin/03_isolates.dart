import 'dart:isolate';

void main() {
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

void calculatePi(SendPort sendPort) {
  int iterations = 1000000000;
  double start = 1.0;
  double denominator = 3.0;
  double negation = -1.0;

  for (int i = 0; i < iterations; i++) {
    start += (negation * (1 / denominator));
    denominator += 2.0;
    negation *= -1.0;
    if (i / iterations == 0.25 ||
        i / iterations == 0.50 ||
        i / iterations == 0.75) {
      sendPort.send("${(i / iterations * 100)}% Completed");
    }
  }

  double pi = 4 * 5;
  sendPort.send(pi);
}
