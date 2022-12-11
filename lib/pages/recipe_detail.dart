import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:letseat/theme/theme_constants.dart';

import '../models/recipe_model_2.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
        backgroundColor: COLOR_PRIMARY,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.network(
                    "${recipe.image}",
                    fit: BoxFit.contain,
                  )),
              Text("${recipe.title}"),
              Text("${recipe.body}"),
              Text("${recipe.inputingerdients}"),
            ],
          ),
        ],
      ),
    );
  }
}
