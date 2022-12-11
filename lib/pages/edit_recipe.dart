import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:letseat/models/recipe_model_2.dart';
import 'package:letseat/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

import '../theme/theme_constants.dart';

class EditRecipePage extends StatefulWidget {
  final Recipe recipe;
  EditRecipePage({super.key, required this.recipe});

  @override
  State<EditRecipePage> createState() => _EditRecipePageState();
}

class _EditRecipePageState extends State<EditRecipePage> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController inputingredientsController;

  File? imageFile;
  String? imageError;

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.recipe.title);
    descriptionController = TextEditingController(text: widget.recipe.body);
    inputingredientsController =
        TextEditingController(text: widget.recipe.inputingerdients);
  }

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
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            backgroundColor: COLOR_PRIMARY,
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
                  child: Image.network(widget.recipe.image),
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
                  child: Text("Change Image"),
                  style: ElevatedButton.styleFrom(
                    primary: COLOR_PRIMARY,
                  )),
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
              ),
              TextFormField(
                controller: inputingredientsController,
                decoration: InputDecoration(hintText: "ingredients"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required field";
                  } else {
                    return null;
                  }
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
                          body: descriptionController.text,
                          image: imageFile!,
                          inputingerdients: inputingredientsController.text,
                          id: int.parse("${widget.recipe.id}"));
                    }
                    print(widget.recipe.title);
                    context.pop();
                  },
                  child: Text(
                    "Confirm Changes",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: COLOR_PRIMARY,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
