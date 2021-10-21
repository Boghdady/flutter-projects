import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:orany_app/src/helpers/constants.dart';
import 'package:orany_app/src/helpers/ui_helpers.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              25, MediaQuery.of(context).size.height * 0.15, 25, 32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/img/illustration.png',
                  width: 300,
                ),
                UIHelper.verticalSpaceMedium,
                Text(
                  'تطبيق اورني'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                UIHelper.verticalSpaceMedium,
                Text(
                  'هو تطبيق يساعدك علي البحث عن مكان للاستضافة او ان تكون مضيف وتساعد الاخرين علي معرفة معالم بلدك كما يساعدك للبحث عن اصذقاء جدد',
                  style: Theme.of(context).textTheme.body2,
                  textAlign: TextAlign.center,
                ),
                UIHelper.verticalSpaceMedium,
                MaterialButton(
                    child: Text('اكتشف التطبيق'.toUpperCase()),
                    minWidth: double.infinity,
                    color: Colors.teal,
                    height: 50,
                    onPressed: () {
                      Navigator.pushNamed(context, bottomNavBarContainerRoute);
                    }),
                UIHelper.verticalSpaceSmall,
                MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  textColor: Colors.teal,
                  child: Text(
                    'تسجيل الدخول'.toUpperCase(),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, loginRoute);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
