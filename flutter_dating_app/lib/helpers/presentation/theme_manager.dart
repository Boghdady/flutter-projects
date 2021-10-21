import 'package:flutter/material.dart';

class ThemeManager {
  static String appName = "Detoo";

  //Colors for theme
  static Color lightPrimary = Colors.white;
  static Color lightAccent = Colors.teal.shade600;
  static Color lightBG = Colors.grey.shade50;
  static Color lightGery = Colors.grey.shade700;

  static ThemeData lightTheme = ThemeData(
    cursorColor: Colors.teal,
    fontFamily: 'Cairo',
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    scaffoldBackgroundColor: lightPrimary,
    appBarTheme: AppBarTheme(
      elevation: 0.5,
      iconTheme: IconThemeData(
        color: Colors.grey.shade700,
      ),
      textTheme: TextTheme(
        // ignore: deprecated_member_use
        title: TextStyle(
          fontFamily: 'Cairo',
          color: lightGery,
          fontSize: 20.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          color: lightGery, fontSize: 20.0, fontWeight: FontWeight.w800),
      headline2: TextStyle(
          color: lightGery, fontSize: 18.0, fontWeight: FontWeight.w700),
      headline3: TextStyle(
          color: lightGery, fontSize: 16.0, fontWeight: FontWeight.w600),
      headline4: TextStyle(
          color: lightGery, fontSize: 14.0, fontWeight: FontWeight.w500),
      headline5: TextStyle(
          color: lightGery, fontSize: 12.0, fontWeight: FontWeight.w400),
      headline6: TextStyle(
          color: lightGery, fontSize: 10.0, fontWeight: FontWeight.w400),
      button: TextStyle(
          color: lightPrimary, fontSize: 16.0, fontWeight: FontWeight.w700),
    ),
    buttonTheme: ButtonThemeData(
//      buttonColor: Colors.teal,
      height: 50.0,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
