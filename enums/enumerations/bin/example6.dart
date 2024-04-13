void main(List<String> args) {
  final fish = AnimalType.fish;

  fish.jump();
}

enum AnimalType with CanJump {
  cat(feetCount: 4),
  dog(feetCount: 4),
  bird(feetCount: 2),
  snake(feetCount: 0),
  fish(feetCount: 0);

  @override
  final int feetCount;

  const AnimalType({required this.feetCount});
}

mixin CanJump {
  int get feetCount;

  void jump() {
    if (feetCount < 1) {
      throw Exception('Cannot jump');
    } else {
      print('Jumped!!');
    }
  }
}
