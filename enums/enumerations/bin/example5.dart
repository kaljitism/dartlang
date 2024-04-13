void main(List<String> args) {
  final vehicle = VehicleType.truck;

  switch (vehicle) {
    case VehicleType.car:
    case VehicleType.bicycle:
    case VehicleType.motorcycle:
      print('This is a personal vehicle');
      break;
    case VehicleType.truck:
      print('This is a commercial vehicle');
      break;
  }
}

enum VehicleType {
  car,
  truck,
  motorcycle,
  bicycle,
}
