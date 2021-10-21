import 'package:flutter/material.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
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
          title: Text(getTranslated(context, 'btn_nav_bar_item_more')),
          leading: Container(),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.green,
        ),
      ),
    );
  }
}
