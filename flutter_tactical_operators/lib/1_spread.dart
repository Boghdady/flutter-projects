import 'package:flutter/material.dart';

List<int> joinCollectionsWithoutSpread() {
  final collection = [1, 2, 3, 4];
  final anotherCollection = [5, 6, 7];
  collection.addAll(anotherCollection);
  return collection;
}

List<int> joinCollectionWithSpread() {
  final collection = [1, 2, 3, 4];
  final anotherCollection = [5, 6, 7];
  return [...collection, ...anotherCollection];
}

class Spread extends StatelessWidget {
  final isLogged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Fake Email Name"),
            Text("Fake Password"),
            if (isLogged) ...[
              RaisedButton(
                onPressed: () {},
                child: Text("Logout"),
              ),
              Text("Forgot Password"),
            ],
            if (!isLogged) ...[
              RaisedButton(
                onPressed: () {},
                child: Text("Register"),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Login"),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
