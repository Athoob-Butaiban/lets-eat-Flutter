import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:letseat/models/category_model.dart';
import 'package:letseat/providers/recipe_provider.dart';
import 'package:letseat/widgets/recipe_card.dart';
import 'package:provider/provider.dart';

import '../models/recipe_model_2.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class RecipePage extends StatelessWidget {
  RecipePage({required this.category, super.key});

  final CategoryModel category;
  // final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lets eat some recipes")),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              color: Color.fromARGB(255, 225, 232, 141),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "${category.name.toCapitalized()} Recipes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  context.push('/add/recipe');
                },
                child: Icon(Icons.add))
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: context.watch<RecipeProvider>().recipes.length,
              itemBuilder: (context, index) => RecipeCard(
                    recipe: context.watch<RecipeProvider>().recipes[index],
                  )),
        ),
      ]),
    );
  }
}
