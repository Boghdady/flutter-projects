import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (CircleAvatar(
      radius: 48.0,
      child: Icon(
        Icons.security,
        size: 56,
        color: Colors.teal,
      ),
      backgroundColor: Colors.grey[300],
    ));
  }
}
