void main(List<String> arguments) {
  Animal dog = Animal("dog");
  print('dog is Dog -> ${dog is Dog}');

  Animal cat = Animal("cat");
  print('cat is Cat -> ${cat is Cat}');

  Animal fish = Animal("fish");
  print('fish is Animal -> ${fish is Animal}');
}

class Animal {
  String type;

  // Factory constructor
  factory Animal(String type) {
    if (type == "cat") {
      return Cat(type);
    }
    if (type == "dog") {
      return Dog(type);
    } else {
      return Animal._type(type);
    }
  }

  // Private named constructor
  Animal._type(this.type);
}

class Cat extends Animal {
  Cat(super.type) : super._type();

  @override
  String toString() {
    return type;
  }
}

class Dog extends Animal {
  Dog(super.type) : super._type();

  @override
  String toString() {
    return type;
  }
}
