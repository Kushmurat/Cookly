class RecipePreviewRemoteResponse {
  RecipePreviewRemoteResponse({
    required this.id,
    required this.name,
    required this.image,
    required this.cookingTime,
    required this.isFavorite,
  });

  factory RecipePreviewRemoteResponse.fromJson(Map<String, dynamic> json) {
    return RecipePreviewRemoteResponse(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      cookingTime: json['cooking_time'],
      isFavorite: json['is_favorite'],
    );
  }

  final int id;
  final String name;
  final String image;
  final int cookingTime;
  final bool isFavorite;
}
