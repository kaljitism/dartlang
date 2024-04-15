// Code written while studying: https://www.youtube.com/watch?v=aWOyc3HG9XM

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
