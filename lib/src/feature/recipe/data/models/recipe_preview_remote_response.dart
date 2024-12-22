import 'package:flutter/foundation.dart';

class RecipePreviewRemoteResponse {
  RecipePreviewRemoteResponse({
    required this.id,
    required this.name,
    required this.image,
    required this.cookingTime,
    required this.isFavorite,
  });

  factory RecipePreviewRemoteResponse.fromJson(Map<String, dynamic>json){
    return RecipePreviewRemoteResponse(
        id: json['id'],
        name: json['name'],
        cookingTime: json['cooking_time'],
        image: json['image'],
        isFavorite: json['is_favourite'],
    );
  }

  final int id;
  final String name;
  final String image;
  final int cookingTime;
  final bool isFavorite;

}

