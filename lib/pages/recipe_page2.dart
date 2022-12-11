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
import '../theme/theme_constants.dart';
import '../theme/theme_manager.dart';

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
  ThemeManager _themeManager = ThemeManager();

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  // void initState() {
  //   _themeManager.addListener(themeListener);
  //   super.initState();
  // }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
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
        backgroundColor: COLOR_PRIMARY,
        actions: [
          Switch(
              value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                _themeManager.toggleTheme(newValue);
              })
        ],
        title: Center(child: letsEat),
      ),
      body: Column(children: [
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
        FloatingActionButton(
          onPressed: () {
            context.push('/add/recipe', extra: widget.category);
          },
          child: Icon(Icons.add),
          backgroundColor: COLOR_PRIMARY,
        )
      ]),
    );
  }
}
