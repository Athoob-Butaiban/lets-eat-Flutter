import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        actions: [
          IconButton(
              onPressed: () {
                context.push('/add');
              },
              icon: Icon(Icons.add_box_outlined))
        ],
        title: Center(
          child: Text(
            'LETS EAT',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
