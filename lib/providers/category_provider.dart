import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:letseat/models/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> categories = [
    CategoryModel(text: "American Food", image: "assets/pic1.jpeg"),
    CategoryModel(text: "Kuwaiti Food", image: "assets/pic2.jpeg"),
  ];
}
