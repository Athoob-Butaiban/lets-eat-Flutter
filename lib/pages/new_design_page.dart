import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:letseat/providers/category_provider.dart';
import 'package:letseat/providers/sign_provider.dart';
import 'package:letseat/widgets/category_card.dart';
import 'package:letseat/theme/theme_constants.dart';
import 'package:letseat/theme/theme_manager.dart';
import 'package:provider/provider.dart';

import '../models/category_model.dart';

class NewHomePage extends StatefulWidget {
  NewHomePage({this.category, super.key});

  final CategoryModel? category;

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  ThemeManager _themeManager = ThemeManager();

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Text("hi"),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: COLOR_PRIMARY,
          actions: [
            Switch(
                value: _themeManager.themeMode == ThemeMode.dark,
                onChanged: (newValue) {
                  _themeManager.toggleTheme(newValue);
                })
          ],
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
          title: Center(child: letsEat),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: context.watch<SignProvider>().username == null
                ? [
                    ElevatedButton(
                      onPressed: () {
                        //if
                        context.push('/signup');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: COLOR_PRIMARY,
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.5, vertical: 0.5),
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
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
                        primary: COLOR_PRIMARY,
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.5, vertical: 0.5),
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Text("Signin"),
                    ),
                  ]
                : [
                    ElevatedButton(
                      onPressed: () {
                        context.read<SignProvider>().signout();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: COLOR_PRIMARY,
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.5, vertical: 0.5),
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Text("Signout"),
                    ),
                  ],
          ),
          Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // children: [
              //   Card(
              //     child: Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: Text(
              //         "CATEGORIES",
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 30,
              //           color: Colors.white70,
              //           backgroundColor: COLOR_ACCENT,
              //         ),
              //       ),
              //     ),
              //   ),
              //   InkWell(
              //       onTap: () {
              //         context.push('/add/category');
              //       },
              //       child: Icon(Icons.add)),
              // ],
              ),
          Expanded(
            child: ListView.builder(
                itemCount: context.watch<CategoryProvider>().categories.length,
                itemBuilder: (context, index) => CategoryCard(
                      category:
                          context.watch<CategoryProvider>().categories[index],
                    )),
          ),
          FloatingActionButton(
            onPressed: () {
              context.push('/add/category');
            },
            child: Icon(Icons.add),
            backgroundColor: COLOR_PRIMARY,
          ),
        ],
      ),
    );
  }
}
