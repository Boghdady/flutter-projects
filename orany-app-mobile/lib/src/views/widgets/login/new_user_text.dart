import 'package:flutter/material.dart';
import 'package:orany_app/src/helpers/constants.dart';
import 'package:orany_app/src/helpers/ui_helpers.dart';
import 'package:orany_app/src/views/screens/authentication/registration.dart';

class NewUserText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Text(
            'هل انت مستخدم جديد؟',
            style: Theme.of(context).textTheme.body2,
          ),
          UIHelper.horizontalSpaceSmall,
          InkWell(
            onTap: () {
//              Navigator.pushNamed(context, registrationRoute);
              MaterialPageRoute newRoute = MaterialPageRoute(
                  builder: (BuildContext context) => Registration());

              Navigator.of(context)
                  .pushAndRemoveUntil(newRoute, ModalRoute.withName('/login'));
            },
            child: Text(
              'انشئ حساب',
              style: TextStyle(fontFamily: 'Cairo', color: Colors.teal),
            ),
          ),
        ],
      ),
    );
  }
}
