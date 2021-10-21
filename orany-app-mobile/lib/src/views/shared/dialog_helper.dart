import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:progress_dialog/progress_dialog.dart';

// show dialog with input textField and button
showLoginDialog(BuildContext context,
    {TextEditingController usernameController,
    TextEditingController loginController,
    Function onLoginPressed}) {
  Alert(
      context: context,
      title: "LOGIN",
      content: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.account_circle),
              labelText: 'Username',
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: 'Password',
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: onLoginPressed,
          child: Text(
            "LOGIN",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}

// show dialog with only button
showAlertDialog(BuildContext context, String title, Function onTitlePress) {
  Alert(
    closeFunction: null,
    context: context,
    type: AlertType.none,
    title: title,
    buttons: [
      DialogButton(
        child: Text(
          "Ok",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: onTitlePress,
        width: MediaQuery.of(context).size.width * 0.50,
      )
    ],
  ).show();
}

// show waiting dialog

showWaitingDialog(BuildContext context, bool showDialog) {
  ProgressDialog pr;
//  pr = new ProgressDialog(context);
  pr = new ProgressDialog(context,
      type: ProgressDialogType.Normal, isDismissible: true, showLogs: false);
  pr.style(
      message: 'Please wait...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: Container(
          padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));
  if (showDialog == true) {
    pr.show();
  } else {
    pr.hide();
  }
}
