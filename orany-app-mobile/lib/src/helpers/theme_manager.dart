import 'package:flutter/material.dart';

class ThemeManager {
  static String appName = "My Own Structure";

  //Colors for theme
  //static Color lightPrimary = Color(0xfffcfcff);
  static Color lightPrimary = Colors.white;
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.blue;
  static Color darkAccent = Colors.blueAccent;
//  static Color lightBG = Color(0xfffcfcff);
  static Color lightBG = Colors.grey.shade50;
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Cairo',
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightPrimary,
    appBarTheme: AppBarTheme(
      elevation: 0.5,
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.grey[800],
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    textTheme: TextTheme(
      headline: TextStyle(
          color: Colors.grey[600], fontSize: 22.0, fontWeight: FontWeight.w800),
      title: TextStyle(
          color: Colors.grey[500], fontSize: 20.0, fontWeight: FontWeight.w600),
      body1: TextStyle(
          color: Colors.grey[500], fontSize: 18.0, fontWeight: FontWeight.w500),
      body2: TextStyle(
          color: Colors.grey[500], fontSize: 14.0, fontWeight: FontWeight.w400),
      button: TextStyle(
          color: lightBG, fontSize: 18.0, fontWeight: FontWeight.w500),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.teal,
      height: 50.0,
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
