class ItemModel {
  final int id;
  final String name;
  final int price;
  final int multiplier;
  final String description;

  ItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.multiplier,
    required this.description,
  });

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      multiplier: map['multiplier'],
      description: map['description'],
    );
  }
}