class IngredientRemoteResponse {
  final int id;
  final String name;
  final String? image;
  final bool isFavourite;
  final bool inBasket;

  IngredientRemoteResponse({
    required this.id,
    required this.name,
    required this.isFavourite,
    required this.inBasket,
    this.image,
  });

  factory IngredientRemoteResponse.fromJson(Map<String, dynamic> json) {
    return IngredientRemoteResponse(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      isFavourite: json['is_favourite'],
      inBasket: json['in_basket'],
    );
  }
}
