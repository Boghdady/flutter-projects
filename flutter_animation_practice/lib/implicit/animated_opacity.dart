import 'package:flutter/material.dart';

import 'animated_container.dart';

class AnimatedOpacityPage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  double _opacityLevel = 0.1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Opacity'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: changeOpacityLevel,
              child: AnimatedOpacity(
                opacity: _opacityLevel,
                duration: Duration(seconds: 1),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AnimatedContainerPage()));
              },
              child: Text("Animated Container"),
            )
          ],
        ),
      ),
    );
  }

  void changeOpacityLevel() {
    if (_opacityLevel != 1) {
      setState(() {
        _opacityLevel = 1;
      });
    } else {
      setState(() {
        _opacityLevel = 0.1;
      });
    }
  }
}
