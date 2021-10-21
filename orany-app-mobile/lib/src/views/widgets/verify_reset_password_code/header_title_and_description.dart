import 'package:flutter/material.dart';
import 'package:orany_app/src/helpers/ui_helpers.dart';

class HeaderTitleAndDescription extends StatelessWidget {
  final String userEmail;

  HeaderTitleAndDescription(this.userEmail);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'تم ارسال الكود علي',
            style: Theme.of(context).textTheme.title,
          ),
          UIHelper.verticalSpaceSmall,
          Text(
            userEmail,
            style: Theme.of(context).textTheme.body2,
          ),
          UIHelper.verticalSpaceMedium,
          Text(
            'ادخل كود التحقق',
            style: Theme.of(context).textTheme.body1,
          )
        ],
      ),
    );
  }
}
