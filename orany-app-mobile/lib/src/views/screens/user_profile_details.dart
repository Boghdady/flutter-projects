import 'package:flutter/material.dart';
import 'package:orany_app/src/Animation/FadeAnimation.dart';

class UserProfileDetails extends StatefulWidget {
  @override
  _UserProfileDetailsState createState() => _UserProfileDetailsState();
}

class _UserProfileDetailsState extends State<UserProfileDetails> {
  final List<List<String>> products = [
    ['https://mylatinabride.com/wp-content/uploads/2019/12/latina-45.jpg'],
    [
      'https://ws2017.falk-ross.eu/out/pictures/master/product/1/188_01_420_m-2017_01.jpg_l.jpg'
    ],
    [
      'https://ichef.bbci.co.uk/news/410/cpsprodpb/1812C/production/_98640689_graciesingle.jpg'
    ],
    [
      'https://media2.newlookassets.com/i/newlook/646092603M4/girls/clothing/tops/girls-dark-grey-rose-too-cute-slogan-t-shirt.jpg?strip=true&qlt=80&w=720'
    ],
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

  void _prev() {
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
                  _prev();
                } else if (details.velocity.pixelsPerSecond.dx < 0) {
                  _next();
                }
              },
              child: FadeAnimation(
                  .8,
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(products[currentIndex][0]),
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
                                  color: Colors.grey,
                                ),
                              ),
                              FadeAnimation(
                                  1.4,
                                  Text(
                                    ' 143 KM Away',
                                    style: TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          FadeAnimation(
                            1.3,
                            Text(
                              'If you are a healthy guy please do not match me. Looking for a good partner. Thank you to match me',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              color: Colors.teal,
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
                                              color: Colors.teal,
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
                                            color: Colors.teal,
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
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
