import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecutre/locator.dart';
import 'package:provider_architecutre/ui/router.dart';
import 'package:provider_architecutre/ui/views/login_view.dart';

import 'core/models/user.dart';
import 'core/services/authentication_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
        initialData: User.initial(),
        builder: (context) => locator<AuthenticationService>().userController,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(),
          initialRoute: 'login',
          onGenerateRoute: Router.generateRoute,
        ));
  }
}
