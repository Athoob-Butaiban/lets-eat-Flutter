import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:letseat/models/category_model.dart';
import 'package:letseat/providers/category_provider.dart';
import 'package:letseat/widgets/category_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({this.category, super.key});

  final CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Text("hi"),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                //if
                context.push('/signup');
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(121, 255, 153, 0),
                padding: EdgeInsets.symmetric(horizontal: 0.5, vertical: 0.5),
                textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Text("Signup"),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/signin');
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(121, 255, 153, 0),
                padding: EdgeInsets.symmetric(horizontal: 0.5, vertical: 0.5),
                textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Text("Signin"),
            ),
          ],
          title: Center(
            child: Text(
              'LETS EAT',
              style:
                  TextStyle(fontSize: 30, color: Color.fromARGB(255, 1, 5, 23)),
            ),
          ),
        ),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              color: Color.fromARGB(255, 225, 232, 141),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "CATEGORIES",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  context.push('/add/category');
                },
                child: Icon(Icons.add))
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: context.watch<CategoryProvider>().categories.length,
              itemBuilder: (context, index) => CategoryCard(
                    category:
                        context.watch<CategoryProvider>().categories[index],
                  )),
        ),
      ]),
    );
  }
}
