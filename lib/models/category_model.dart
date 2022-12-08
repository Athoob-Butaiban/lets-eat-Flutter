import 'dart:convert';

class CategoryModel {
  String name;
  String image;
  int id;
  CategoryModel({
    required this.name,
    required this.image,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'id': id,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));
}
