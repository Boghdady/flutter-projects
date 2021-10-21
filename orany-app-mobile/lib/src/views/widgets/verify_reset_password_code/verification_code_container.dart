import 'package:flutter/material.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_bloc.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_event.dart';
import 'package:orany_app/src/views/shared/shared_app_bar.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';

import 'footer_button_and_text.dart';
import 'header_title_and_description.dart';

class VerificationCodeContainer extends StatelessWidget {
  final AuthenticationBloc bloc;
  final String userId;
  final String userEmail;

  VerificationCodeContainer({this.bloc, this.userId, this.userEmail});

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
              HeaderTitleAndDescription(userEmail),
              Container(
                margin: EdgeInsets.only(top: 24.0),
                child: Material(
                  elevation: 1,
                  shadowColor: Colors.grey,
                  child: VerificationCodeInput(
                    keyboardType: TextInputType.number,
                    length: 4,
                    itemSize: 60,
                    onCompleted: (String value) {
                      bloc.emitEvent(AuthenticationEventVerifyPasswordResetCode(
                        userId: userId,
                        passwordResetCode: int.parse(value),
                      ));
                    },
                  ),
                ),
              ),
              FooterButtonAndText(),
            ],
          ),
        ),
      ),
    );
  }
}
