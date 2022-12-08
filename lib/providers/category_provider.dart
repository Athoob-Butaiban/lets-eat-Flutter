import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:letseat/models/category_model.dart';

import '../client.dart';

class CategoryProvider extends ChangeNotifier {
  // List<CategoryModel> categories = [
  //   CategoryModel(text: "American Food", image: "assets/pic1.jpeg"),
  //   CategoryModel(text: "Kuwaiti Food", image: "assets/pic2.jpeg"),
  // ];
  List<CategoryModel> categories = [];

  var isLoading = true;

  CategoryProvider() {
    getCategories();
  }

  Future<void> getCategories() async {
    isLoading = true;
    notifyListeners();

    var response = await Client.dio.get("/categories/");

    var CatrgoryJasonList = response.data as List;

    categories =
        CatrgoryJasonList.map((e) => CategoryModel.fromMap(e)).toList();

    isLoading = false;
    notifyListeners();
  }

  Future<void> addCategory({
    required String text,
    required File image,
  }) async {
    await Client.dio.post("/categories/",
        data: FormData.fromMap({
          "name": text,
          "image": await MultipartFile.fromFile(image.path),
        }));

    getCategories();
  }

  void editCategory({
    required String text,
    required File image,
    required int id,
  }) async {
    await Client.dio.patch("/categories/$id",
        data: FormData.fromMap({
          "title": text,
          "image": await MultipartFile.fromFile(image.path),
        }));

    getCategories();
  }

  void deleteCategory(int id) async {
    await Client.dio.delete("/categories/$id");

    getCategories();
  }

  void signout() {}
}
