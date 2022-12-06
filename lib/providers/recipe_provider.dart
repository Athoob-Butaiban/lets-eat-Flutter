import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../client.dart';
import '../models/recipe_model_2.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> recipes = [];
  var isLoading = true;

  void getRecipes() async {
    isLoading = true;
    notifyListeners();

    var response = await Client.dio.get("/recipes");

    var RecipeJasonList = response.data as List;

    recipes = RecipeJasonList.map((e) => Recipe.fromMap(e)).toList();

    isLoading = false;
    notifyListeners();
  }

  void addRecipe({
    required String title,
    required String description,
    required File image,
  }) async {
    await Client.dio.post("/recipes",
        data: FormData.fromMap({
          "title": title,
          "description": description,
          "image": await MultipartFile.fromFile(image.path),
        }));

    getRecipes();
  }

  void editRecipe({
    required String title,
    required String description,
    required File image,
    required int id,
  }) async {
    await Client.dio.patch("/recipes/$id",
        data: FormData.fromMap({
          "title": title,
          "description": description,
          "image": await MultipartFile.fromFile(image.path),
        }));

    getRecipes();
  }

  void deleteRecipe(int id) async {
    await Client.dio.delete("/recipes/$id");

    getRecipes();
  }
}
