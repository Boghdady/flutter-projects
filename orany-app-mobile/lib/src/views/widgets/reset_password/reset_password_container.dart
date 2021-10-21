import 'package:flutter/material.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_bloc.dart';
import 'package:orany_app/src/helpers/ui_helpers.dart';
import 'package:orany_app/src/views/shared/shared_app_bar.dart';
import 'package:orany_app/src/views/widgets/reset_password/reset_password_form.dart';

class ResetPasswordContainer extends StatelessWidget {
  final AuthenticationBloc bloc;
  final String userId;

  ResetPasswordContainer({this.bloc, this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(title: 'استعادة كلمة المرور'),
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
              ResetPasswordForm(bloc: bloc, userId: userId),
            ],
          ),
        ),
      ),
    );
  }
}
