import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:letseat/pages/signup_page.dart';

import 'package:letseat/pages/signin.dart';

import 'package:letseat/pages/home_page.dart';
import 'package:letseat/providers/category_provider.dart';
import 'package:letseat/providers/main_provider.dart';
import 'package:letseat/providers/sign_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

final router = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => Singin(),
  ),
  GoRoute(
    path: "/rec",
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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = GoRouter(routes: [
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
        ChangeNotifierProvider(create: (context) => SignProvider()),
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
