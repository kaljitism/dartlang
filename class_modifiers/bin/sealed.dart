// Sealed Class
sealed class Vehicle {}

// Can be inherited(in its own library)
class Car extends Vehicle {}

// Can be implemented(in its own library)
class Truck implements Vehicle {}

// Another inherited case to understand a compiler check at line 21.
class Bicycle extends Vehicle {}

// Error: Can't be instantiated
Vehicle vehicle = Vehicle();

// Subclasses can be instantiated
Vehicle car = Car();

String getVehicleType(Vehicle vehicle) {
  // Error: Type is not exhaustively match
  return switch (vehicle) {
    Car() => 'Car',
    Truck() => 'Truck',
  };
}
