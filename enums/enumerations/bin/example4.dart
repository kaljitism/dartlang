void main(List<String> args) {
  describe(animalType(fromStr: 'cat'));
  describe(animalType(fromStr: 'horse'));
  describe(animalType(fromStr: 'rabbit'));
  describe(animalType(fromStr: 'monkey'));
  describe(animalType(fromStr: 'dog'));
}

void describe(AnimalType? animalType) {
  switch (animalType) {
    case AnimalType.rabbit:
      print('This is a Rabbit');
      break;
    case AnimalType.dog:
      print('This is a Dog');
      break;
    case AnimalType.cat:
      print('This is a Cat');
      break;
    case null:
      print('Unknown Animal');
      break;
  }
}

AnimalType? animalType({required String fromStr}) {
  try {
    return AnimalType.values.firstWhere(
      (element) => element.name == fromStr,
    );
  } catch (e) {
    return null;
  }
}

enum AnimalType {
  rabbit,
  dog,
  cat,
}
