import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:letseat/models/recipe_model_2.dart';

class UpdateRecipe extends StatefulWidget {
  final Recipe recipe;
  const UpdateRecipe({super.key, required this.recipe});

  @override
  State<UpdateRecipe> createState() => _UpdateRecipeState();
}

class _UpdateRecipeState extends State<UpdateRecipe> {
  final keyForm = GlobalKey<FormState>();

  var image;
  String title = "";
  String description = "";
  String ingredients = "";
  final pick = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update recipe"),
        centerTitle: true,
      ),
      body: Form(
        key: keyForm,
        child: Column(children: [
          Text("make changes for the recipe"),
          UpdateRecipe(recipe: widget.recipe),

          // validator: (vlaue){
          //   if (value!.isEmpty){
          //     return "please fill this field";
          //   }
          //   onSave:(value){}
          // }
        ]),
      ),
    );
  }
}
