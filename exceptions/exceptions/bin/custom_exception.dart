void main(List<String> arguments) {
  Pub pub = Pub();
  Person person1 = Person(name: 'Jane', age: 20);
  Person person2 = Person(name: 'Jackie', age: 17);
  Person person3 = Person(name: 'John', age: 25);
  Person person4 = Person(name: 'Jerry', age: 15);

  try {
    pub.enterInPub(person1);
    pub.enterInPub(person2);
    pub.enterInPub(person3);
    pub.enterInPub(person4);
  } on UnderageException catch (e) {
    print(e);
  }

  print('\nEntry list: ${pub.entryList.map((e) => e.name).toList()}');
}

class Person {
  final String name;
  final int age;

  Person({
    required this.name,
    required this.age,
  });
}

class Pub {
  List<Person> entryList = [];

  int legalAge = 18;

  void enterInPub(Person person) {
    try {
      if (person.age < legalAge) {
        throw UnderageException(person.name);
      } else {
        entryList.add(person);
      }
    } on UnderageException catch (e) {
      print(e);
    }
  }
}

class UnderageException implements Exception {
  final String person;

  UnderageException(this.person);

  @override
  String toString() {
    return '$person is not of legal age.';
  }
}
