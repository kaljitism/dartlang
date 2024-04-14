// Dependencies
import 'dart:developer';

// Base Clas
base class Vehicle {
  void moveForward(int meters) => log('Moved $meters m');
}

// Can be constructed
Vehicle vehicle = Vehicle();

// Can be extended
base class Car extends Vehicle {
  int passengers = 4;
}

// ERROR: Can't be implemented because of Incorrect Signature
base class MockVehicle implements Vehicle {
  @override
  void moveForward() => print('Moved');
}
