import 'dart:io';

void main(List<String> arguments) {
  int index;
  List<String> names = [
    'John',
    'Jackie',
    'Jerry',
    'Sarah',
  ];
  String? input;

  stdout.write('Enter an integer: ');
  input = stdin.readLineSync();

  try {
    index = int.parse(input!);
    print(names[index]);
  } on FormatException {
    print('Invalid input. Please enter an integer.');
  } on RangeError {
    print('Invalid index. Please enter a valid index.');
  } finally {
    print('You should fix the exception.');
  }
}
