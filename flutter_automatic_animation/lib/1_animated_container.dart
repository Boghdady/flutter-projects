import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart';

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double containerSize = 300;
  double containerTranslationY = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildAnimationWidget(),
            buildChangeStuffButton(),
          ],
        ),
      ),
    );
  }

  Widget buildAnimationWidget() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      width: containerSize,
      height: containerSize,
      transform: Matrix4.translation(Vector3(0, containerTranslationY, 0)),
      child: Image.asset('assets/logo.png'),
      curve: Curves.easeOutCirc,
    );
  }

  Widget buildChangeStuffButton() {
    return RaisedButton(
      onPressed: () {
        setState(() {
          containerSize = 200 + math.Random().nextInt(100).toDouble();
          containerTranslationY = math.Random().nextInt(200).toDouble();
        });
      },
      child: Text("Translate"),
    );
  }
}
