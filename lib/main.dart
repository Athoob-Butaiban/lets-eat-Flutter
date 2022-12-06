import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:letseat/pages/American_Food_page.dart';
import 'package:letseat/pages/recipy_page.dart';
import 'package:letseat/pages/signup_page.dart';

import 'package:letseat/pages/signin.dart';

import 'package:letseat/pages/home_page.dart';
import 'package:letseat/providers/category_provider.dart';
import 'package:letseat/providers/main_provider.dart';
import 'package:letseat/providers/recipes_provider.dart';
import 'package:letseat/providers/sign_provider.dart';
import 'package:letseat/providers/signin_provider.dart';
import 'package:provider/provider.dart';

import 'models/recipies_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    MainProvider.dioClient.options.baseUrl = "http://10.0.2.2:8000";
  }

  var signProvider = SignProvider();
  var authorized = await signProvider.tokena(); // checking the token

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
    path: "/American_Food",
    builder: (context, state) => AmericanFood(),
  ),
  GoRoute(
    path: "/recipies",
    builder: (context, state) => RecipyPage(
      recipy: state.extra as RecipesModel,
    ),
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
        ChangeNotifierProvider(create: (context) => MainProvider()),
        ChangeNotifierProvider(create: (context) => signProvider),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => SigninProvider()),
        ChangeNotifierProvider(create: (context) => RecipesProvider()),
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
