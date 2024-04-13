void main(List<String> args) {
  TeslaCar modelS = TeslaCar.modelS;
  TeslaCar model3 = TeslaCar.model3;

  print(
      "${modelS.name} has ${modelS.compareTo(model3)} Kg more weight than ${model3.name}");
}

enum TeslaCar implements Comparable<TeslaCar> {
  modelS(weightInKg: 2108),
  model3(weightInKg: 1610),
  modelX(weightInKg: 2495),
  modelY(weightInKg: 1995);

  final int weightInKg;

  const TeslaCar({required this.weightInKg});

  @override
  int compareTo(TeslaCar other) {
    return weightInKg - other.weightInKg;
  }
}
