void main() {
  // Destructuring
  final (lat, lon) = getLocation();
  print('Latitude: $lat, Longitude: $lon');
}

(int, int) getLocation() {
  return (1, 2);
}
