import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Color.fromRGBO(245, 245, 245, 1.0),
    primary: Color.fromRGBO(29, 161, 242, 1.0),
    secondary: Color.fromRGBO(156, 39, 176, 1.0),
    inversePrimary: Color.fromRGBO(0, 95, 158, 1.0),
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  ),
);
