import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_news_app/screens/onboarding.dart';
import 'package:flutter_news_app/screens/home_screen.dart';
import 'package:flutter_news_app/utilities/app_theme.dart';

main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  Widget _screen;

  if (seen == null || seen == false) {
    _screen = OnBoarding();
  } else {
    _screen = HomePage();
  }
  runApp(NewsApp(_screen));
}

class NewsApp extends StatelessWidget {
  Widget _screen;
  // constructor
  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: this._screen,
    );
  }
}
