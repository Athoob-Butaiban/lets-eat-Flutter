import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:letseat/models/category_model.dart';

import '../client.dart';
import '../models/recipe_model_2.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> recipes = [];
  // CategoryModel? category;
  var isLoading = true;

  Future<void> getRecipes({CategoryModel? category}) async {
    // try {
    isLoading = true;
    notifyListeners();

    // this.category = category;

    var response = await Client.dio.get("/recipes/");

    var RecipeJasonList = response.data as List;

    recipes = RecipeJasonList.map((e) => Recipe.fromMap(e)).toList();

    if (category != null) {
      recipes =
          recipes.where((recipe) => recipe.category == category.id).toList();
    }

    isLoading = false;
    notifyListeners();
    // } catch (e) {
    //   print(e);
    // }
  }

  Future<void> addRecipe({
    required String title,
    required String body,
    required File image,
    required int category,
    required int ingredients,
    required int user,
    required String inputingerdients,
  }) async {
    // try {
    await Client.dio.post("/recipes/",
        data: FormData.fromMap({
          "title": title,
          "body": body,
          "image": await MultipartFile.fromFile(image.path),
          "category": category,
          "ingredients": ingredients,
          "user": user,
          "inputingerdients": inputingerdients,
        }));

    getRecipes();
    // } catch (e) {
    //   print(e);
    // }
  }

  Future<void> editRecipe({
    required String title,
    required String body,
    required File image,
    required String inputingerdients,
    required int id,
  }) async {
    try {
      await Client.dio.patch("/recipes/$id/",
          data: FormData.fromMap({
            "title": title,
            "body": body,
            "image": await MultipartFile.fromFile(image.path),
            "inputingerdients": inputingerdients,
          }));

      getRecipes();
    } catch (e) {
      print(e);
    }
  }

  void deleteRecipe(int id) async {
    await Client.dio.delete("/recipes/$id/");

    getRecipes();
  }
}
