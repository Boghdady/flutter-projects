import 'package:flutter/material.dart';

class ThemeManager {
  static String appName = "My Own Structure";

  //Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.blue;
  static Color darkAccent = Colors.blueAccent;
  //static Color lightBG = Color(0xfffcfcff);
  static Color lightBG = Colors.grey[100];
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
            color: Colors.grey[800],
            fontSize: 24.0,
            fontWeight: FontWeight.w500),
      ),
    ),
    textTheme: TextTheme(
      headline: TextStyle(
          color: Colors.grey[800], fontSize: 36.0, fontWeight: FontWeight.w800),
      title: TextStyle(
          color: Colors.grey[800], fontSize: 24.0, fontWeight: FontWeight.w600),
      body1: TextStyle(
          color: Colors.grey[800], fontSize: 18.0, fontWeight: FontWeight.w400),
      button: TextStyle(
          color: lightBG, fontSize: 18.0, fontWeight: FontWeight.w500),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}
