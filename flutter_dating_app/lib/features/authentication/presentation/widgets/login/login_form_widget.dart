import 'package:auto_size_text/auto_size_text.dart';
import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutterdatingapp/helpers/presentation/animation/fade_animation.dart';
import 'package:flutterdatingapp/helpers/presentation/constants.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';
import 'package:flutterdatingapp/helpers/presentation/shared/loading_button.dart';
import 'package:flutterdatingapp/helpers/presentation/shared/shared_text_field.dart';
import 'package:flutterdatingapp/helpers/presentation/ui_helpers.dart';

import '../../../../../main.dart';

class LoginFormWidget extends StatefulWidget {
  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          FadeAnimation(
              0.5,
              SharedTextField(
//            stream: _loginFormBloc.emailStream,
                hintText: getTranslated(context, 'txt_login_email'),
                onChanged: (value) => {},
                suffixIcon: Icons.email,
                prefixIcon: null,
                obscureText: false,
                controller: _emailController,
              )),
          UIHelper.verticalSpaceSmall,
          FadeAnimation(
              0.6,
              SharedTextField(
//            stream: _loginFormBloc.passwordStream,
                hintText: getTranslated(context, 'txt_login_password'),
                onChanged: (value) => {},
                suffixIcon: Icons.security,
                prefixIcon: Icons.lock,
                obscureText: true,
                controller: _passwordController,
              )),
          UIHelper.verticalSpaceMedium,
          Container(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, forgotPageRoute);
              },
              child: FadeAnimation(
                  0.7,
                  AutoSizeText(
                    getTranslated(context, 'lbl_login_forget_password'),
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.teal,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                    minFontSize: 14,
                  )),
            ),
          ),
          UIHelper.verticalSpaceMedium,
          FadeAnimation(
            0.8,
            LoadingButton(
              loading: _loading,
              text: getTranslated(context, 'btn_login'),
              onPress: () {
                setState(() => _loading = true);
                Future.delayed(Duration(seconds: 3), () {
                  setState(() => _loading = false);
                  Navigator.pushReplacementNamed(
                      context, bottomNavigationRoute);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void _changeLanguage(String lng) async {
    Locale _locale = await setLocale(lng);
    MyApp.setLocale(context, _locale);
  }
}
