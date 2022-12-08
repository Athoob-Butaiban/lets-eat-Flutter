import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:letseat/models/recipe_model_2.dart';
import 'package:provider/provider.dart';

import '../providers/category_provider.dart';

class RecipeCard extends StatelessWidget {
  RecipeCard({required this.recipe, super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          color: Color.fromARGB(255, 225, 232, 141),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.network(
                  "${recipe.image}",
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Text(
                  "${recipe.title}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  "${recipe.body}",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
