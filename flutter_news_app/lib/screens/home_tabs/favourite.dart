import 'dart:math';

import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<Color> colorsList = [
    Colors.red,
    Colors.teal,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.pinkAccent,
    Colors.deepPurpleAccent,
  ];

  Random _random = Random();
  Color _randomColor() {
    return colorsList[_random.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _drawCardHeader(),
                SizedBox(
                  height: 8.0,
                ),
                _drawCardBody(),
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _drawCardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: 30,
              height: 30,
              margin: EdgeInsets.only(right: 5),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Michael Adams",
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        "15 min",
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 11,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "Lifestyle",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: _randomColor(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          color: Colors.grey,
          onPressed: () {},
        )
      ],
    );
  }

  Widget _drawCardBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          height: 90,
          width: 100,
          margin: EdgeInsets.only(right: 16.0),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                "Google AI Defeats Human Go Champions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We also talk about the future of work as the robots advance, and we ask whether a retro phone",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
