import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:letseat/models/category_model.dart';
import 'package:letseat/providers/recipe_provider.dart';
import 'package:letseat/widgets/recipe_card.dart';
import 'package:provider/provider.dart';

import '../models/recipe_model_2.dart';
import '../providers/sign_provider.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class RecipePage extends StatefulWidget {
  RecipePage({required this.category, super.key});

  final CategoryModel category;

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<RecipeProvider>().getRecipes(category: widget.category);
    });
  }

  // final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            ElevatedButton(
              onPressed: () {
                context.read<SignProvider>().signout();
                context.pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(121, 255, 153, 0),
                padding: EdgeInsets.symmetric(horizontal: 0.5, vertical: 0.5),
                textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Text("SignOut"),
            ),
          ],
          title: Text(
            "LETS EAT SOME RECIPES ",
            style:
                TextStyle(fontSize: 22, color: Color.fromARGB(255, 1, 5, 23)),
          )),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              color: Color.fromARGB(255, 225, 232, 141),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Click + to add a new Recipe",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  context.push('/add/recipe');
                },
                child: Icon(Icons.add_box_outlined)),
          ],
        ),
        context.watch<RecipeProvider>().isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: ListView.builder(
                    itemCount: context.watch<RecipeProvider>().recipes.length,
                    itemBuilder: (context, index) {
                      return RecipeCard(
                        recipe: context.watch<RecipeProvider>().recipes[index],
                      );
                    }),
              ),
      ]),
    );
  }
}
