import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterdatingapp/helpers/presentation/animation/fade_animation.dart';
import 'package:flutterdatingapp/helpers/presentation/constants.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';
import 'package:flutterdatingapp/helpers/presentation/ui_helpers.dart';

class LoginFooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FadeAnimation(
              0.9,
              AutoSizeText(
                getTranslated(context, 'lbl_login_new_user'),
                style: Theme.of(context).textTheme.headline4,
                minFontSize: 14,
              )),
          UIHelper.horizontalSpaceSmall,
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, registrationPageRoute);
            },
            child: FadeAnimation(
                1,
                AutoSizeText(
                  getTranslated(context, 'lbl_login_create_account'),
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    color: Colors.teal,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  minFontSize: 14,
                )),
          ),
        ],
      ),
    );
  }
}
