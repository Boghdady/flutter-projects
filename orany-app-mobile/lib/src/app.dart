import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orany_app/src/helpers/constants.dart';
import 'package:orany_app/src/helpers/router.dart';
import 'package:orany_app/src/helpers/theme_manager.dart';
import 'package:orany_app/src/views/screens/authentication/decision_page.dart';
import 'package:orany_app/src/core/utils/globals.dart' as globals;

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          isDark ? ThemeManager.darkPrimary : ThemeManager.lightPrimary,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
//      onUnknownRoute: (settings) {
//        return MaterialPageRoute(builder: (ctx) => DecisionPage());
//      },
      initialRoute: welcomeRoute,
      title: ThemeManager.appName,
      theme: isDark ? ThemeManager.darkTheme : ThemeManager.lightTheme,
      home: DecisionPage(),
    ));
  }
}
