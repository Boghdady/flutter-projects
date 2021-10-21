import 'package:flutter/material.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
          title: Text(getTranslated(context, 'btn_nav_bar_item_chat')),
          leading: Container(),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
