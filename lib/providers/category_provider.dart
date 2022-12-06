import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:letseat/models/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> categories = [
    CategoryModel(id: 1, text: "American Food", image: "assets/pic1.jpeg"),
    CategoryModel(id: 2, text: "Kuwaiti Food", image: "assets/pic2.jpeg"),
  ];
}
