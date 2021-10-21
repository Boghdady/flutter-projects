import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_bloc_section14/src/helpers/router.dart';
import '../src/helpers/constants.dart';
import 'helpers/theme_manager.dart';

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
      initialRoute: loginRoute,
      title: ThemeManager.appName,
      theme: isDark ? ThemeManager.darkTheme : ThemeManager.lightTheme,
    ));
  }
}
