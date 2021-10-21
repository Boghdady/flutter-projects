import 'package:flutter/material.dart';

class RegistrationHeadlineText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'ادخل البيانات التالية',
          style: Theme.of(context).textTheme.headline,
        ),
        Divider(),
      ],
    );
  }
}
