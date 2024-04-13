void main() {
  Item item1 = Item('some state');
  Item item2 = Item('some other state');
  Item item3 = Item('different state');

  print(item1.state);
  print(item2.state);
  print(item3.state);

  print(item1 == item2);
  print(item2 == item3);
  print(item3 == item1);
}

class Item {
  factory Item(String state) {
    Item.item ??= Item._internal()..state = state;
    return Item.item!..state = state;
  }

  static Item? item;
  Item._internal();

  String? state;
}
