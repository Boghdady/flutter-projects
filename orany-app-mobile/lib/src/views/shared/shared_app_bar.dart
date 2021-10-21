import 'package:flutter/material.dart';
import 'package:orany_app/src/views/screens/authentication/login.dart';

class SharedAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  SharedAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: <Widget>[
        new IconButton(
          icon: new Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey[600],
          ),
          onPressed: () {
            MaterialPageRoute newRoute = MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen());

            Navigator.of(context).pushAndRemoveUntil(
                newRoute, ModalRoute.withName('/registration'));
          },
        ),
      ],
      leading: new Container(),
      title: Container(
        alignment: Alignment.centerRight,
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
