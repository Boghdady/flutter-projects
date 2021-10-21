import 'package:flutter/material.dart';
import 'package:flutterdatingapp/helpers/presentation/constants.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';
import 'package:flutterdatingapp/helpers/presentation/shared/loading_button.dart';
import 'package:flutterdatingapp/helpers/presentation/shared/shared_text_field.dart';
import 'package:flutterdatingapp/helpers/presentation/ui_helpers.dart';

class ResetPasswordPage extends StatefulWidget {
  final String userId;
  ResetPasswordPage({this.userId});
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController _passwordController;
  TextEditingController _passwordConfirmController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController?.dispose();
    _passwordConfirmController?.dispose();
    super.dispose();
  }

  ///
  /// Prevents the use of the "back" button
  ///
  Future<bool> _onWillPopScope() async {
    return false;
  }

  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            getTranslated(context, 'lbl_retrieve_password'),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 34.0,
              right: 24.0,
              left: 24.0,
            ),
            child: Column(
              children: <Widget>[
                UIHelper.verticalSpaceMedium,
                Form(
                  child: Column(
                    children: <Widget>[
                      SharedTextField(
                        controller: _passwordController,
                        textInputType: TextInputType.text,
                        hintText: getTranslated(context, 'txt_login_password'),
                        onChanged: (val) {},
                        suffixIcon: Icons.security,
                        prefixIcon: Icons.lock,
                        obscureText: true,
                      ),
                      UIHelper.verticalSpaceSmall,
                      SharedTextField(
                        controller: _passwordConfirmController,
                        textInputType: TextInputType.text,
                        hintText: getTranslated(context, 'txt_retype_password'),
                        onChanged: (val) {},
                        suffixIcon: Icons.security,
                        prefixIcon: Icons.lock,
                        obscureText: true,
                      ),
                      UIHelper.verticalSpaceMedium,
                      LoadingButton(
                          loading: _loading,
                          text: getTranslated(context, 'btn_save'),
                          onPress: () {
                            setState(() => _loading = true);
                            Future.delayed(
                              Duration(seconds: 3),
                              () => setState(() {
                                _loading = false;
                                Navigator.of(context)
                                    .pushReplacementNamed(loginPageRoute);
                              }),
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
