/*
This repository uses the code in the docs for enums.
*/

void main(List<String> args) {
  final personWithCar = Person('John', Vehicle.car);
  final personWithBiCycle = Person('Jane', Vehicle.bicycle);

  switch (personWithCar.vehicle) {
    case Vehicle.car:
      print('${personWithCar.name} has ${personWithCar.vehicle}');
      break;
    case Vehicle.bus:
      print('${personWithCar.name} has ${personWithCar.vehicle}');
      break;
    case Vehicle.bicycle:
      print('${personWithCar.name} has ${personWithCar.vehicle}');
      break;
  }

  switch (personWithBiCycle.vehicle) {
    case Vehicle.car:
      print('${personWithBiCycle.name} has ${personWithBiCycle.vehicle}');
      break;
    case Vehicle.bus:
      print('${personWithBiCycle.name} has ${personWithBiCycle.vehicle}');
      break;
    case Vehicle.bicycle:
      print('${personWithBiCycle.name} has ${personWithBiCycle.vehicle}');
      break;
  }

  print(
      'Carbon Footprint of ${personWithCar.vehicle} is ${personWithCar.vehicle.carbonFootprint}');
  print(
      'Carbon Footprint of ${personWithBiCycle.vehicle} is ${personWithBiCycle.vehicle.carbonFootprint}');
  print(
      '${personWithCar.name} has ${personWithCar.vehicle.compareTo(personWithBiCycle.vehicle)} more Carbon Footprint than ${personWithBiCycle.name}');
}

class Person {
  final String name;
  final Vehicle vehicle;

  Person(this.name, this.vehicle);
}

enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 100),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  bool get isTwoWheeler => this == Vehicle.bicycle;

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}
