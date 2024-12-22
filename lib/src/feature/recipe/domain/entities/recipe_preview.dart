class RecipePreview {
  RecipePreview({
    required this.id,
    required this.name,
    required this.image,
    required this.cookingTime,
    required this.isFavorite,
  });

  final int id;
  final String name;
  final String image;
  final int cookingTime;
  final bool isFavorite;
}
