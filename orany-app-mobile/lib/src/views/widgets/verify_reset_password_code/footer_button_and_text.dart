import 'package:flutter/material.dart';
import 'package:orany_app/src/helpers/ui_helpers.dart';

class FooterButtonAndText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16.0),
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              child: Text(
                'استمرار',
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                // TODO: Apply api login
              },
            ),
          ),
          UIHelper.verticalSpaceMedium,
          Row(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text(
                'لم يصل اليك الكود ؟',
                style: Theme.of(context).textTheme.body2,
              ),
              UIHelper.horizontalSpaceSmall,
              InkWell(
                onTap: () {},
                child: Text(
                  'اعاده ارسال الكود',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
