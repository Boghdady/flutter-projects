import 'package:flutter/material.dart';

class SocialMediaDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'او يمكنك استخدام وسائل التواصل الاجتماعي',
        style: Theme.of(context).textTheme.body2,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
