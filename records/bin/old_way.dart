void main() {
  final location = getLocation();
  print(location);
}

Location getLocation() {
  return Location(1, 2);
}

class Location {
  Location(this.x, this.y);

  final int x;
  final int y;

  @override
  String toString() {
    return "[Latitude: $x, Longitude: $y]";
  }
}
