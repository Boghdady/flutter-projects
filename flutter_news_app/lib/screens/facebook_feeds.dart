import 'package:flutter/material.dart';
import 'package:flutter_news_app/shared_ui/navigation_drawer.dart';

class FacebookFeeds extends StatefulWidget {
  @override
  _FacebookFeedsState createState() => _FacebookFeedsState();
}

class _FacebookFeedsState extends State<FacebookFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Facebook Feeds",
          style: TextStyle(
            letterSpacing: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _drawCardHeader(),
                  _drawCardBody(),
                  _drawCardFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _drawCardHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/bg.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Jared Adams",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Fri, 12 May 2017 • 14.30",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
                color: Colors.grey,
                iconSize: 24,
              ),
              Transform.translate(
                offset: Offset(-8, 0),
                child: Text(
                  "25",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _drawCardBody() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("We also talk about the future of work as the robots"),
              SizedBox(
                height: 8.0,
              ),
              Wrap(
                children: <Widget>[
                  Text(
                    "#advance",
                    style: _hashTagTextStyle(),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "#retro",
                    style: _hashTagTextStyle(),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "#facebook",
                    style: _hashTagTextStyle(),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Image(
            image: ExactAssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _drawCardFooter() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "10",
                style: _hashTagTextStyle(),
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                "COMMENTS",
                style: _hashTagTextStyle(),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text(
                  "SHARE",
                  style: _hashTagTextStyle(),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "OPEN",
                  style: _hashTagTextStyle(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle _hashTagTextStyle() {
    return TextStyle(
      color: Colors.orange,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }
}
