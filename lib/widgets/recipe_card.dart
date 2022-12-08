import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:letseat/models/recipe_model_2.dart';
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
        Card(
          color: Color.fromARGB(255, 225, 232, 141),
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
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${widget.recipe.body}",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              context.push('/edit/recipe',
                                  extra: widget.recipe);
                            },
                            child: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
