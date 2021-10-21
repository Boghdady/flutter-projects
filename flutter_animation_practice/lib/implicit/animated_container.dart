import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 150.0;
  double _height = 150.0;
  double _radius = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: changeContainerSize,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(
                Radius.circular(_radius),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changeContainerSize() {
    setState(() {
      _height = Random().nextDouble() * 200;
      _width = Random().nextDouble() * 200;
      _radius = Random().nextDouble() * 10;
    });
  }
}
