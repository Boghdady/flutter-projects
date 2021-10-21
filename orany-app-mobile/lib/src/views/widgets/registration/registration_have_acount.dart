import 'package:flutter/material.dart';
import 'package:orany_app/src/helpers/constants.dart';
import 'package:orany_app/src/helpers/ui_helpers.dart';

class RegistrationHaveAcount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Text(
            'هل لديك حساب؟',
            style: Theme.of(context).textTheme.body2,
          ),
          UIHelper.horizontalSpaceSmall,
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, loginRoute);
            },
            child: Text(
              'سجل الآن',
              style: TextStyle(fontFamily: 'Cairo', color: Colors.teal),
            ),
          ),
        ],
      ),
    );
  }
}
