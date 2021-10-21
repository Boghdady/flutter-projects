import 'package:flutter/material.dart';
import 'package:flutterdatingapp/features/authentication/presentation/widgets/login/login_footer_widget.dart';
import 'package:flutterdatingapp/features/authentication/presentation/widgets/login/login_form_widget.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';
import 'package:flutterdatingapp/helpers/presentation/ui_helpers.dart';
import '../../../../main.dart';

class LoginPage extends StatelessWidget {
  ///
  /// Prevents the use of the "back" button
  ///
  Future<bool> _onWillPopScope() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        appBar: AppBar(
          title: Text(getTranslated(context, "btn_login")),
          centerTitle: true,
          leading: Container(),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: <Widget>[
                UIHelper.verticalSpaceMedium,
                LoginFormWidget(),
                UIHelper.verticalSpaceMedium,
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
