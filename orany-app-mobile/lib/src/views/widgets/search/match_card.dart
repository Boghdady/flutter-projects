import 'package:flutter/material.dart';
import 'package:orany_app/src/helpers/const.dart';
import 'package:orany_app/src/helpers/constants.dart';

class MatchCard extends StatelessWidget {
  final Map cat;

  const MatchCard({Key key, this.cat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, userProfileDetailsRoute);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 2.0, top: 4.0, right: 2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Stack(
            children: <Widget>[
              Image.asset(
                cat["img"],
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                top: 5.0,
                right: 5.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  height: 11,
                  width: 11,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
//                        color: widget.isOnline ? Colors.greenAccent : Colors.grey,
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      height: 7,
                      width: 7,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
