import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:orany_app/src/helpers/ui_helpers.dart';
import 'package:orany_app/src/views/screens/welcome.dart';
import 'package:orany_app/src/views/shared/dialog_helper.dart';

class SocialMediaButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 70,
            height: 60,
            child: SignInButton(
              Buttons.Facebook,
              mini: true,
              onPressed: () {
                // TODO: Apply facebook login
              },
            ),
          ),
          UIHelper.horizontalSpaceSmall,
          Container(
            width: 70,
            height: 60,
            child: SignInButton(
              Buttons.Google,
              mini: true,
              text: 'االدخول  بحساب جوجل',
              onPressed: () {
//                showAlertDialog(context, );
              },
            ),
          ),
          UIHelper.horizontalSpaceSmall,
          Container(
            width: 70,
            height: 60,
            child: SignInButton(
              Buttons.Twitter,
              mini: true,
              text: 'االدخول  بحساب جوجل',
              onPressed: () {
                // TODO: Apply google account login
              },
            ),
          ),
        ],
      ),
    );
  }
}
