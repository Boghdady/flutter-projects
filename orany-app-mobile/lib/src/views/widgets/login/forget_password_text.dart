import 'package:flutter/material.dart';
import 'package:orany_app/src/helpers/constants.dart';
import 'package:orany_app/src/views/screens/authentication/forget_password.dart';

class ForgetPasswordLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          MaterialPageRoute newRoute = MaterialPageRoute(
            builder: (BuildContext context) => ForgetPasswordScreen(),
          );

          Navigator.of(context).pushAndRemoveUntil(
              newRoute, ModalRoute.withName(forgetPasswordRoute));
        },
        child: Text(
          'نسيت كلمة المرور؟',
          style: TextStyle(fontFamily: 'Cairo', color: Colors.teal),
        ),
      ),
    );
  }
}
