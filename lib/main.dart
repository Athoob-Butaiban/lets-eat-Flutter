import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:letseat/pages/signup_page.dart';

import 'package:letseat/pages/signin.dart';

import 'package:letseat/pages/home_page.dart';
import 'package:letseat/providers/category_provider.dart';
import 'package:letseat/providers/main_provider.dart';
import 'package:letseat/providers/sign_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  var signProvider = SignProvider();
  var authorized = await signProvider.tokena(); // checking the token

  print("authorized $authorized"); // to test

  runApp(MyApp(
    signProvider: signProvider,
    intitialRoute: authorized
        ? "/"
        : "/signin", // #### for now the other path is signin page
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
]);

class MyApp extends StatelessWidget {
  final String intitialRoute;
  final SignProvider signProvider;

  MyApp({required this.intitialRoute, required this.signProvider});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = GoRouter(initialLocation: intitialRoute, routes: [
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
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainProvider()),

        ChangeNotifierProvider(create: (context) => signProvider),

        ChangeNotifierProvider(create: (context) => CategoryProvider()),

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
