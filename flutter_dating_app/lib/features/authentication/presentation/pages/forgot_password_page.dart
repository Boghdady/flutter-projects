import 'package:flutter/material.dart';
import 'package:flutterdatingapp/helpers/presentation/animation/fade_animation.dart';
import 'package:flutterdatingapp/helpers/presentation/constants.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';
import 'package:flutterdatingapp/helpers/presentation/shared/loading_button.dart';
import 'package:flutterdatingapp/helpers/presentation/shared/shared_text_field.dart';
import 'package:flutterdatingapp/helpers/presentation/ui_helpers.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _emailController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController?.dispose();
    super.dispose();
  }

  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(getTranslated(context, 'lbl_retrieve_password'))),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 34.0,
            right: 24.0,
            left: 24.0,
          ),
          child: Column(
            children: <Widget>[
              FadeAnimation(
                  0.5,
                  Image.asset(
                    'assets/img/code.png',
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: MediaQuery.of(context).size.height * 0.25,
                  )),
              UIHelper.verticalSpaceMedium,
              FadeAnimation(
                  0.6,
                  SharedTextField(
                    controller: _emailController,
                    textInputType: TextInputType.emailAddress,
                    hintText: getTranslated(context, 'txt_login_email'),
                    onChanged: (value) {},
                    suffixIcon: Icons.email,
                    prefixIcon: null,
                    obscureText: false,
                  )),
              UIHelper.verticalSpaceMedium,
              FadeAnimation(
                0.7,
                LoadingButton(
                    loading: _loading,
                    text: getTranslated(context, 'btn_continue'),
                    onPress: () {
                      setState(() => _loading = true);
                      Future.delayed(
                        Duration(seconds: 3),
                        () => setState(() {
                          _loading = false;
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            VerifyResetCodePageRoute,
                            ModalRoute.withName(forgotPageRoute),
                          );
                        }),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
