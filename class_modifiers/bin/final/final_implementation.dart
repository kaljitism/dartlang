// Dependency of Final Class
import 'final.dart';

// Can be constructed
Vehicle vehicle = Vehicle();

// Error: Can't be extended outside the root library
class Car extends Vehicle {
  int passengers = 4;
  // ...
}

// Error: Can't be implemented outside the root library
class MockVehicle implements Vehicle {
  @override
  void moveForward(int meters) {
    // ...
  }
}
