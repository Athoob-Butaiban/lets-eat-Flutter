import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class Singin extends StatelessWidget {
  const Singin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Signin Page"),
        actions: [
          IconButton(
              onPressed: () {
                context.push("/add"); // to add the router to the page
              },
              icon: Icon(Icons.add_box_outlined) // to add the button
              )
        ],
      ),
    );
  }
}
