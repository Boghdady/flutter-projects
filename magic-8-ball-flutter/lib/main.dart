import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Ask Me Anything'),
        centerTitle: true,
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
          child: Text(
            'Ask Me Anything',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontFamily: 'Pacifico',
            ),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
          child: SizedBox(
            width: 300,
            child: Divider(
              height: 5,
              color: Colors.white,
            ),
          ),
        ),
        FlatButton(
          child: Image.asset('images/ball$ballNumber.png'),
          onPressed: () {
            setState(() {
              ballNumber = Random().nextInt(5) + 1;
            });
          },
        ),
      ],
    );
  }
}
