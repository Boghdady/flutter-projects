import 'package:flutter/material.dart';
import 'package:orany_app/src/helpers/ui_helpers.dart';

class TitleAndSubtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'مرحبا بك',
            style: Theme.of(context).textTheme.headline,
          ),
          UIHelper.verticalSpaceSmall,
          Text(
            'يجب ان تسجل لتتمكن من الدخول',
            style: Theme.of(context).textTheme.body1,
          ),
          UIHelper.verticalSpaceSmall,
        ],
      ),
    );
  }
}
