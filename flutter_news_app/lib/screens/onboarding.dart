import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/page_view_model.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  // define objects and variables
  List<PageViewModel> pages;
  ValueNotifier<int> _valueNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    _addPagesContent();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/bg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        child: Icon(
                          pages[index].icon,
                          color: Colors.white,
                          size: 150,
                        ),
                        offset: Offset(0, -60),
                      ),
                      Text(
                        pages[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Text(
                          pages[index].description,
                          style: TextStyle(
                            color: Colors.blueGrey.shade200,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index) {
              _valueNotifier.value = index;
            },
          ),
          Transform.translate(
            offset: Offset(0, 160),
            child: Align(
              alignment: Alignment.center,
              child: _addPageIndicators(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50, right: 24, left: 24),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  color: Colors.red.shade800,
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        //TODO
                        _updateSeen();
                        return HomePage();
                      },
                    ));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // update shared preferences value
  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }

  // add pages content ( icon - title - description)
  void _addPagesContent() {
    pages = List<PageViewModel>();
    pages.add(PageViewModel(
      "Wlcome!-1",
      "1- Welcome to flutter SDk, the future of mobile developemnt",
      Icons.ac_unit,
    ));
    pages.add(PageViewModel(
      "Wlcome!-2",
      "2- Welcome to flutter SDk, the future of mobile developemnt",
      Icons.account_box,
    ));
    pages.add(PageViewModel(
      "Wlcome!-3",
      "3- Welcome to flutter SDk, the future of mobile developemnt",
      Icons.adb,
    ));
    pages.add(PageViewModel(
      "Wlcome!-4",
      "4- Welcome to flutter SDk, the future of mobile developemnt",
      Icons.add_alert,
    ));
  }

  // add page indicators depending on number of pages
  Widget _addPageIndicators() {
    return PageViewIndicator(
      pageIndexNotifier: _valueNotifier,
      length: pages.length,
      normalBuilder: (animationController, index) => Circle(
            size: 10.0,
            color: Colors.white,
          ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
            scale: CurvedAnimation(
              parent: animationController,
              curve: Curves.ease,
            ),
            child: Circle(
              size: 14.0,
              color: Colors.red,
            ),
          ),
    );
  }
}
