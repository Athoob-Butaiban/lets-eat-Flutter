import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:letseat/models/category_model.dart';

import '../client.dart';
import '../models/recipe_model_2.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> recipes = [];
  CategoryModel? category;
  var isLoading = true;

  Future<void> getRecipes() async {
    try {
      isLoading = true;
      notifyListeners();

      // this.category = category;

      var response = await Client.dio.get("/recipes/");

      var RecipeJasonList = response.data as List;

      recipes = RecipeJasonList.map((e) => Recipe.fromMap(e)).toList();

      recipes = recipes;

      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void addRecipe({
    required String title,
    required String description,
    required File image,
  }) async {
    try {
      await Client.dio.post("/recipes",
          data: FormData.fromMap({
            "title": title,
            "description": description,
            "image": await MultipartFile.fromFile(image.path),
          }));

      getRecipes();
    } catch (e) {
      print(e);
    }
  }

  void editRecipe({
    required String title,
    required String description,
    required File image,
    required int id,
  }) async {
    try {
      await Client.dio.patch("/recipes/$id",
          data: FormData.fromMap({
            "title": title,
            "description": description,
            "image": await MultipartFile.fromFile(image.path),
          }));

      getRecipes();
    } catch (e) {
      print(e);
    }
  }

  void deleteRecipe(int id) async {
    await Client.dio.delete("/recipes/$id");

    getRecipes();
  }
}
