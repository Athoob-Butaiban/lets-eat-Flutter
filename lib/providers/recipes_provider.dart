import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/recipies_model.dart';

class AmericanFoodProvider extends ChangeNotifier {
  List<RecipesModel> recipes = [
    RecipesModel(text: "Burger", image: "assets/pic3.jpeg"),
    RecipesModel(text: "Steak", image: "assets/pic4.jpeg"),
  ];
}

class KuwaitiFoodProvider extends ChangeNotifier {
  List<RecipesModel> recipes = [
    RecipesModel(text: "Majbos", image: "assets/pic5.jpeg"),
    RecipesModel(text: "yreesh ", image: "assets/pic6.jpeg"),
  ];
}

class RecipesProvider extends ChangeNotifier {
  List<RecipesModel> recipes = [];

  Future<void> loadRecipes(String category) async {}
}
