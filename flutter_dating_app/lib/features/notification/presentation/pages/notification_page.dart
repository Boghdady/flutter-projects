import 'package:flutter/material.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  ///
  /// Prevents the use of the "back" button
  ///
  Future<bool> _onWillPopScope() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        appBar: AppBar(
          title: Text(getTranslated(context, 'btn_nav_bar_item_notification')),
          leading: Container(),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blue,
        ),
      ),
    );
  }
}
