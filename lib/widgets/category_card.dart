import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:letseat/models/category_model.dart';
import 'package:letseat/providers/recipe_provider.dart';
import 'package:letseat/theme/theme_constants.dart';
import 'package:letseat/widgets/help_widgets.dart';
import 'package:provider/provider.dart';

import '../providers/category_provider.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({required this.category, super.key});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(
        '/recipes',
        extra: category,
      ),
      child: Card(
        color: COLOR_ACCENT,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // CircleAvatar(
                  //   radius: 50,
                  //   // foregroundImage:
                  // ),
                  SizedBox(
                      height: 75,
                      width: 75,
                      child: Image.network(
                        "${category.image}",
                        fit: BoxFit.cover,
                      )),

                  Text(
                    "${category.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
