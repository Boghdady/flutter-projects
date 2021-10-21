import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseMessage extends StatefulWidget {
  FirebaseMessage({Key key}) : super(key: key);

  @override
  _FirebaseMessageState createState() => _FirebaseMessageState();
}

class _FirebaseMessageState extends State<FirebaseMessage> {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _fcm.getToken().then((token) {
      print("Token is : $token");

      // Create table in direbase database to save all tokens
      // Firestore.instance.collection('tokens').add({'token': token});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
    );
  }
}
