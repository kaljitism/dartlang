void main(List<String> arguments) {}

class Animal {
  String type;

  // Factory constructor
  factory Animal(String type) {
    if (type == "cat") Cat(type);
    if (type == "dog") Dog(type);
    return Animal._type(type);
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
