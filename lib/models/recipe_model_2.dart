import 'dart:convert';

class Recipe {
  int id;
  String title;
  String image;
  String body;
  int category;
  List<int> ingredients;
  int user;
  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.body,
    required this.category,
    required this.ingredients,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'body': body,
      'category': category,
      'ingredients': ingredients,
      'user': user,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      body: map['body'] ?? '',
      category: map['category']?.toInt() ?? 0,
      ingredients: List<int>.from(map['ingredients']),
      user: map['user']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) => Recipe.fromMap(json.decode(source));
}
