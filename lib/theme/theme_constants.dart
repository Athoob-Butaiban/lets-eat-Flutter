import 'package:flutter/material.dart';

const COLOR_PRIMARY = Color.fromARGB(235, 81, 26, 85);
const COLOR_ACCENT = Color.fromARGB(114, 181, 34, 255);

// Color.fromARGB(255, 225, 232, 141);

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: COLOR_PRIMARY,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            backgroundColor: MaterialStateProperty.all<Color>(COLOR_ACCENT))));

ThemeData darkTheme =
    ThemeData(brightness: Brightness.dark, primaryColor: COLOR_ACCENT);

ThemeData colorBar =
    ThemeData(backgroundColor: Color.fromARGB(255, 225, 232, 141));

// routerConfig: router,
//         theme: lightTheme,
//         darkTheme: darkTheme,
//         themeMode: _themeManager.themeMode,
//         themBar: colorBar,
//         debugShowCheckedModeBanner: false,

// appBarTheme: AppBarTheme(

Text letsEat = Text(
  "LETS EAT",
  style: TextStyle(fontSize: 30, color: Colors.white),
);


// ElevatedButton signs = ElevatedButton(onPressed:(){},
// style: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                 EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
//             shape: MaterialStateProperty.all<OutlinedBorder>(
//                 RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20.0))),
//             backgroundColor: MaterialStateProperty.all<Color>(COLOR_ACCENT))));
//  , child: child)