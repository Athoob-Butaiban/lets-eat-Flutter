import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:letseat/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'shatti test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => SignupPage(),
    ),
  ],
);
