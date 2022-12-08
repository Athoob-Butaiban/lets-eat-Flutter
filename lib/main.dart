import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:letseat/models/recipe_model_2.dart';
import 'package:letseat/pages/add_category.dart';

import 'package:letseat/client.dart';
import 'package:letseat/models/category_model.dart';
import 'package:letseat/pages/add_recipe.dart';
import 'package:letseat/pages/recipe_page2.dart';
import 'package:letseat/pages/signup_page.dart';

import 'package:letseat/pages/signin.dart';

import 'package:letseat/pages/home_page.dart';
import 'package:letseat/providers/category_provider.dart';
import 'package:letseat/providers/recipe_provider.dart';
import 'package:letseat/providers/sign_provider.dart';
import 'package:provider/provider.dart';

import 'client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    Client.dio.options.baseUrl = "http://10.0.2.2:8000";
  } else if (Platform.isIOS) {
    Client.dio.options.baseUrl = "http://localhost:8000";
  }
  var signProvider = SignProvider();
  var authorized = await signProvider.hasToken(); // checking the token

  print("authorized $authorized"); // to test the autherization

  runApp(MyApp(
    signProvider: signProvider,
    intitialRoute: authorized
        ? "/"
        : "/signup", // #### for now the other path is signup page
  ));
}

final router = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => HomePage(),
  ),
  GoRoute(
    path: "/signup",
    builder: (context, state) => SignupPage(),
  ),
  GoRoute(
    path: "/signin",
    builder: (context, state) => Singin(),
  ),
  GoRoute(
    path: "/add/category",
    builder: (context, state) => AddCategoryPage(),
  ),
  GoRoute(
    path: "/recipes",
    builder: (context, state) => RecipePage(
      category: state.extra as CategoryModel,
    ),
  ),
  GoRoute(
    path: "/add/recipe",
    builder: (context, state) => AddRecipePage(),
  ),
]);

class MyApp extends StatelessWidget {
  final String intitialRoute;
  final SignProvider signProvider;

  MyApp({required this.intitialRoute, required this.signProvider});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => signProvider),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => SignProvider()),
        ChangeNotifierProvider(create: (context) => RecipeProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 225, 232, 141),
        )),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
