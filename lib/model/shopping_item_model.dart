class ShoppingItemModel {
  final String name;

  final int qty;

  final bool hasBought;

  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.qty,
    required this.hasBought,
    required this.isSpicy,
  });

  ShoppingItemModel copyWith({
    String? name,
    int? qty,
    bool? hasBought,
    bool? isSpicy,
  }) {
    return ShoppingItemModel(
      name: name ?? this.name,
      qty: qty ?? this.qty,
      hasBought: hasBought ?? this.hasBought,
      isSpicy: isSpicy ?? this.isSpicy,
    );
  }
}
