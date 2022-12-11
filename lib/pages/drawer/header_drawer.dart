import 'package:flutter/material.dart';
import 'package:letseat/theme/theme_constants.dart';

class HeaderDrawer extends StatefulWidget {
  HeaderDrawer({super.key});

  @override
  State<HeaderDrawer> createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_PRIMARY,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 70,
        ),
        Text(
          "LETS EAST",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        Text(
          "Cook Your Own Food",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ]),
    );
  }
}
