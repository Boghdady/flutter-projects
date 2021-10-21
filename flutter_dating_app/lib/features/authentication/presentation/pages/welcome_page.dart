import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterdatingapp/helpers/presentation/animation/fade_animation.dart';
import 'package:flutterdatingapp/helpers/presentation/constants.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';
import 'package:flutterdatingapp/helpers/presentation/ui_helpers.dart';

import '../../../../main.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.12,
          left: 32,
          right: 32,
          bottom: 16.0,
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              FadeAnimation(
                0.5,
                Image.asset(
                  'assets/img/heart.png',
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
              ),
              UIHelper.verticalSpaceMedium,
              FadeAnimation(
                  0.6,
                  AutoSizeText(
                    getTranslated(context, 'app_name').toUpperCase(),
                    style: Theme.of(context).textTheme.headline1,
                  )),
              UIHelper.verticalSpaceSmall,
              FadeAnimation(
                  0.7,
                  AutoSizeText(
                    getTranslated(context, 'app_description'),
                    minFontSize: 16,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  )),
              UIHelper.verticalSpaceLarge,
              FadeAnimation(
                  0.8,
                  MaterialButton(
                      child: Text(
                          getTranslated(context, 'btn_discover').toUpperCase()),
                      minWidth: double.infinity,
                      color: Colors.teal,
                      onPressed: () {
                        _changeLanguage('ar');
//                      Navigator.pushNamed(context, bottomNavBarContainerRoute);
                      })),
              UIHelper.verticalSpaceSmall,
              FadeAnimation(
                  0.9,
                  MaterialButton(
                    minWidth: double.infinity,
                    textColor: Colors.teal,
                    child: Text(
                      getTranslated(context, 'btn_login').toUpperCase(),
                    ),
                    onPressed: () {
//                    _changeLanguage('en');
                      Navigator.pushReplacementNamed(context, loginPageRoute);
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _changeLanguage(String lng) async {
    Locale _locale = await setLocale(lng);
    MyApp.setLocale(context, _locale);
  }
}
