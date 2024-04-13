void main(List<String> args) {
  AnimalType.rabbit
    ..jump()
    ..run();
  AnimalType.cat
    ..run()
    ..jump();
}

enum AnimalType {
  cat,
  dog,
  rabbit;

  void run() {
    print('$name is running...');
  }
}

extension Jump on AnimalType {
  void jump() {
    print('$name is jumping...');
  }
}
