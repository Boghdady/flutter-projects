import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterdatingapp/helpers/presentation/animation/fade_animation.dart';
import 'package:flutterdatingapp/helpers/presentation/constants.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';
import 'package:flutterdatingapp/helpers/presentation/ui_helpers.dart';

class RegistrationFooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FadeAnimation(
              1.7,
              AutoSizeText(
                getTranslated(context, 'lbl_registration_have_account'),
                style: Theme.of(context).textTheme.headline3,
              )),
          UIHelper.horizontalSpaceSmall,
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, loginPageRoute);
            },
            child: FadeAnimation(
                1.7,
                Text(
                  getTranslated(context, 'lbl_registration_login_now'),
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    color: Colors.teal,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
