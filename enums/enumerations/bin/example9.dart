void main(List<String> args) {
  print([...TeslaCar.values]..sort());
}

enum TeslaCar implements Comparable<TeslaCar> {
  modelS(weightInKg: 2108),
  model3(weightInKg: 1610),
  modelX(weightInKg: 2495),
  modelY(weightInKg: 1995);

  final int weightInKg;

  const TeslaCar({required this.weightInKg});

  @override
  int compareTo(TeslaCar other) => weightInKg.compareTo(other.weightInKg);
}
