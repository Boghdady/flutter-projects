import 'package:flutter/material.dart';
import 'package:flutter_tactical_operators/1_spread.dart';
import 'package:flutter_tactical_operators/2_cascade.dart';
import 'package:flutter_tactical_operators/3_nulls.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tactical Operator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NullAware(),
    );
  }
}
