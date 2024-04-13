/*
This example is taken from Vandad's Enum video on YT.
*/

void main(List<String> args) {
  final person = Person('John', Car.bmwX5);

  switch (person.car) {
    case Car.bmwX5:
      print('${person.name} has ${person.car}');
      break;
    case Car.bmwX6:
      print('${person.name} has ${person.car}');
      break;
    case Car.bmwX7:
      print('${person.name} has ${person.car}');
      break;
    case Car.teslaModelX:
      print('${person.name} has ${person.car}');
      break;
    case Car.teslaModelS:
      print('${person.name} has ${person.car}');
      break;
    case Car.teslaModel3:
      print('${person.name} has ${person.car}');
      break;
  }
}

class Person {
  final String name;
  final Car car;

  Person(this.name, this.car);
}

enum Car {
  bmwX5('BMW', 'X5', 2024),
  bmwX6('BMW', 'X6', 2024),
  bmwX7('BMW', 'X7', 2024),
  teslaModelX('Tesla', 'Model X', 2024),
  teslaModelS('Tesla', 'Model S', 2024),
  teslaModel3('Tesla', 'Model 3', 2024);

  final String manufacturer;
  final String model;
  final int year;

  const Car(
    this.manufacturer,
    this.model,
    this.year,
  );

  @override
  String toString() => '$manufacturer Model $model, $year';
}
