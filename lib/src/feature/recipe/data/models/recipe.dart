class Recipe {
  final String imageUrl;
  final String title;
  final String description;
  final List<Ingredient> ingredients;
  final List<Step> steps;

  Recipe({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.steps,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      imageUrl: json['imageUrl'],
      title: json['title'],
      description: json['description'],
      ingredients: (json['ingredients'] as List)
          .map((item) => Ingredient.fromJson(item))
          .toList(),
      steps: (json['steps'] as List).map((item) => Step.fromJson(item)).toList(),
    );
  }
}

class Ingredient {
  final String name;
  final String amount;

  Ingredient({required this.name, required this.amount});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      amount: json['amount'],
    );
  }
}

class Step {
  final String title;
  final String description;

  Step({required this.title, required this.description});

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      title: json['title'],
      description: json['description'],
    );
  }
}
