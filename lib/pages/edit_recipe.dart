import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:letseat/models/recipe_model_2.dart';
import 'package:letseat/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

class EditRecipePage extends StatefulWidget {
  final Recipe recipe;
  EditRecipePage({super.key, required this.recipe});

  @override
  State<EditRecipePage> createState() => _EditRecipePageState();
}

class _EditRecipePageState extends State<EditRecipePage> {
  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  File? imageFile;
  String? imageError;
  String title = "";
  String description = "";

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: Center(
              child: Text(
                'Edit recipe',
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 1, 5, 23)),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          // child: Form(
          //   key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (imageFile != null)
                Image.file(
                  imageFile!,
                  height: 100,
                  width: 100,
                )
              else
                Container(
                  child: Icon(Icons.image),
                  width: 100,
                  height: 100,
                ),
              ElevatedButton(
                  onPressed: () async {
                    //////////////need to install image picker package before activating the code below

                    var file = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);

                    if (file == null) {
                      return;
                    }

                    setState(() {
                      imageFile = File(file.path);
                      imageError = null;
                    });
                  },
                  child: Text("Change Image")),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(hintText: "Title"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required field";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  title = value!;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(hintText: "description"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required field";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  description = value!;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (imageFile == null) {
                      setState(() {
                        imageError = "Image is required";
                      });
                    }

                    if (formKey.currentState!.validate() && imageFile != null) {
                      formKey.currentState!.save();

                      context.read<RecipeProvider>().editRecipe(
                          title: titleController.text,
                          description: descriptionController.text,
                          image: imageFile!,
                          id: widget.recipe.id);
                    }
                    context.pop();
                  },
                  child: Text("Confirm Changes")),
            ],
          ),
        ),
      ),
    );
  }
}
