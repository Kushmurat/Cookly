class Ingredient {
  final int id;
  final String name;
  final String? image;
  final bool isFavourite;
  final bool inBasket;

  Ingredient({
    required this.id,
    required this.name,
    required this.isFavourite,
    required this.inBasket,
    this.image,
  });
}
