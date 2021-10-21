import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final bool loading;
  final String text;
  final Function onPress;

  const LoadingButton({Key key, this.loading, this.text, this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FLLoadingButton(
      minWidth: double.infinity,
      color: Colors.teal,
      indicatorColor: Colors.white,
      disabledTextColor: Colors.grey.shade300,
      disabledColor: Colors.teal,
      indicatorOnly: false,
      loading: loading,
      child: Text(
        text,
      ),
      onPressed: onPress,
    );
  }
}
