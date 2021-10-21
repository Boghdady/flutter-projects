import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SharedButton extends StatelessWidget {
  final Function onPressed;
  final String title;

  const SharedButton({this.onPressed, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        child: Text(
          title,
          style: Theme.of(context).textTheme.button,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
