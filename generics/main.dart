/*

Generics in Dart is a feature that allows Developers to write code that can be reused for different types of data.

Generics are used to create classes, interfaces, and methods that operate on objects of specified types.

Mnemonic Conventions for Generic Types:
E - Element (used extensively by the collection classes)
K and V for Key and Value (used extensively by the Associative collection classes)
R - Return Type
T, S, and U (and so on) - 2nd, 3rd, and 4th types for when T is already in use.
If none of the above suits  the need, the type can be named something more descriptive.
*/

void main() {
  // Collections have parameterized types
  // These parameterized types come from Generics
  // They are the way to work the same code with any arbitrary type
  // When the user instantiates the class, they can specify the type of data they want to work with
  // Like we are specifying the type of data in the List and Map below
  List<String> list = <String>[];
  Map<int, String> map = <int, String>{};
  print('$list, $map');

  // Here, while instantiating the class, we are specifying the generic type using our parameterized type 'String'
  PrintItems<String> string = PrintItems(5, 'hello');
  string.printItem();

  PrintItems<double> d = PrintItems(2, 3.14);
  d.printItem();

  PrintItems<PrintItems> recur = PrintItems(3, string);
  recur.printItem();

  // Working with Generics that extend some type.
  // ignore: unused_local_variable
  printType<int> integer = printType(2);
  // ignore: unused_local_variable
  printType<double> doubleVal = printType(3.14);

  // Working with Generic Types inside a Function
  generics<List, double>([2, 3, "Hello"], 3.14);
  generics("Something", 4);
}

// A Class that works with generic type T
class PrintItems<T> {
  int times;
  T printedItem;

  PrintItems(this.times, this.printedItem);

  void printItem() {
    for (int i = 0; i < times; i++) {
      print(printedItem);
    }
  }

  @override
  String toString() {
    return "$printedItem to be printed...> $times times";
  }
}

// We can also make a Generic Type extends another Type

class printType<T extends num> {
  late var type;
  T item;

  printType(this.item) : type = item.runtimeType.toString() {
    print(type);
  }
}

// Generics can also be used inside Functions & Methods
String generics<T, S>(T a, S b) {
  return "$a and $b";
}
