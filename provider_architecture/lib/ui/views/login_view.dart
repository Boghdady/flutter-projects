import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecutre/core/enums/viewstate.dart';
import 'package:provider_architecutre/core/viewmodels/login_model.dart';
import 'package:provider_architecutre/ui/shared/app_colors.dart';
import 'package:provider_architecutre/ui/widgets/login_header.dart';

import '../../locator.dart';
import 'base_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
            backgroundColor: backgroundColor,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginHeader(
                  controller: controller,
                  validationMessage: model.errorMessage,
                ),
                model.state == ViewState.Busy
                    ? CircularProgressIndicator()
                    : FlatButton(
                        color: Colors.white,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          var loginSuccess = await model.login(controller.text);
                          if (loginSuccess) {
                            // Navigate to the home view
                            Navigator.pushNamed(context, '/');
                          }
                        }),
              ],
            ),
          ),
    );
  }
}
