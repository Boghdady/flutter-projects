import 'package:flutter/material.dart';
import 'package:orany_app/src/helpers/ui_helpers.dart';

class RegistrationTermsOfUseAndPrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text(
                'باستمرارك تكون قد وافقت علي',
                style: Theme.of(context).textTheme.body2,
              ),
              UIHelper.horizontalSpaceXSmall,
              InkWell(
                onTap: () {},
                child: Text(
                  'الشروط والاحكام',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    color: Colors.teal,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text(
                'و',
                style: Theme.of(context).textTheme.body2,
              ),
              UIHelper.horizontalSpaceXSmall,
              InkWell(
                onTap: () {},
                child: Text(
                  'سياسية الخصوصية',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    color: Colors.teal,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
