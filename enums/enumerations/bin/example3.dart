void main(List<String> args) {
  Animal whiskers = Animal.rabbit;

  switch (whiskers) {
    case Animal.cat:
      print('Whiskers is a cat');
      break;
    case Animal.dog:
    case Animal.rabbit:
      break;
    default:
      print('Whiskers is some animal but not a cat, dog, or rabbit');
  }
}

enum Animal {
  cat,
  dog,
  rabbit,
  monkey,
}
