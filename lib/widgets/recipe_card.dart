import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:letseat/models/recipe_model_2.dart';
import 'package:letseat/providers/recipe_provider.dart';
import 'package:letseat/theme/theme_constants.dart';
import 'package:provider/provider.dart';

import '../providers/category_provider.dart';

class RecipeCard extends StatefulWidget {
  RecipeCard({required this.recipe, super.key});

  final Recipe recipe;

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {
            context.push("/detail/recipe", extra: widget.recipe);
          },
          child: Card(
            color: COLOR_ACCENT,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.network(
                    "${widget.recipe.image}",
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "${widget.recipe.title}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      Text(
                        "${widget.recipe.body}",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            color: Colors.black),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          InkWell(
                              onTap: () {
                                context.push('/edit/recipe',
                                    extra: widget.recipe);
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.white70,
                              )),
                          IconButton(
                              onPressed: () {
                                context
                                    .read<RecipeProvider>()
                                    .deleteRecipe(widget.recipe.id);

                                // context.pop();
                              },
                              icon: Icon(Icons.delete, color: Colors.white70)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
