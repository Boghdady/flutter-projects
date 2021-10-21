import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  double currentIndexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Text('More Screen'),
    ));
  }
}
