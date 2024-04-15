// Code written while studying https://www.youtube.com/watch?v=aWOyc3HG9XM

void main() {
  // Destructuring
  final (lat: latitude, lon: longitude) = getLocation();
  print('Latitude: $latitude, Longitude: $longitude');
}

({int lat, int lon}) getLocation() {
  return (lat: 1, lon: 2);
}
