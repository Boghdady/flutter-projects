import 'package:day18_carousel/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<List<String>> products = [
    ['assets/images/watch-1.jpg'],
    ['assets/images/watch-2.jpg'],
    ['assets/images/watch-3.jpg'],
    ['assets/images/watch-3.jpg'],
    ['assets/images/watch-2.jpg'],
  ];

  int currentIndex = 0;

  void _next() {
    setState(() {
      if (currentIndex < products.length - 1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _preve() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.velocity.pixelsPerSecond.dx > 0) {
                  _preve();
                } else if (details.velocity.pixelsPerSecond.dx < 0) {
                  _next();
                }
              },
              child: FadeAnimation(
                  .8,
                  Container(
                    width: double.infinity,
                    height: 550,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(products[currentIndex][0]),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.grey[700].withOpacity(.9),
                            Colors.grey.withOpacity(.0),
                          ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FadeAnimation(
                              1,
                              Container(
                                width: 90,
                                margin: EdgeInsets.only(bottom: 60),
                                child: Row(
                                  children: _buildIndicator(),
                                ),
                              ))
                        ],
                      ),
                    ),
                  )),
            ),
            Expanded(
              child: Transform.translate(
                offset: Offset(0, -40),
                child: FadeAnimation(
                    1,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(
                              1.3,
                              FittedBox(
                                child: Text(
                                  'Hugo Boss, 26',
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          SizedBox(
                            height: 4.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              FadeAnimation(
                                1.4,
                                Icon(
                                  Icons.location_on,
                                  size: 18,
                                  color: Colors.yellow[700],
                                ),
                              ),
                              FadeAnimation(
                                  1.4,
                                  Text(
                                    ' 143 KM Away',
                                    style: TextStyle(
                                        color: Colors.yellow[700],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          FadeAnimation(
                            1.3,
                            Text(
                              'If you are a healthy guy please do not match me. Looking for a good partner. Thank you to match me',
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: FadeAnimation(
                                      1.7,
                                      InkWell(
                                        onTap: () {
                                          // TODO:
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              color: Colors.yellow[700],
                                              borderRadius:
                                                  BorderRadius.circular(24)),
                                          child: Center(
                                            child: Icon(
                                              Icons.close,
                                              size: 32,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: FadeAnimation(
                                      1.7,
                                      InkWell(
                                        onTap: () {
                                          // TODO:
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              color: Colors.yellow[700],
                                              borderRadius:
                                                  BorderRadius.circular(24)),
                                          child: Center(
                                            child: Icon(
                                              Icons.favorite_border,
                                              size: 32,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: FadeAnimation(
                                      1.7,
                                      InkWell(
                                        onTap: () {
                                          // TODO:
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              color: Colors.yellow[700],
                                              borderRadius:
                                                  BorderRadius.circular(24)),
                                          child: Center(
                                            child: Icon(
                                              Icons.chat,
                                              size: 32,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return Expanded(
      child: Container(
        height: 4,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isActive ? Colors.grey[800] : Colors.white),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < products.length; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
