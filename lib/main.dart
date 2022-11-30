import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:letseat/pages/home_page.dart';
import 'package:letseat/providers/main_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

final router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => HomePage(),
  ),
]);

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => MainProvider())],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
