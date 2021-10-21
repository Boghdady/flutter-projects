import 'package:flutter/material.dart';
import 'package:flutter_news_app/shared_ui/navigation_drawer.dart';

class TwitterFeeds extends StatefulWidget {
  @override
  _TwitterFeedsState createState() => _TwitterFeedsState();
}

class _TwitterFeedsState extends State<TwitterFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Twitter Feeds",
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
                children: <Widget>[
                  _drawCardHeaderAndBody(),
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

  Widget _drawCardHeaderAndBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
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
                    Row(
                      children: <Widget>[
                        Text(
                          "Jared Adams",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "@AdamsJared",
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                      ],
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
          SizedBox(
            height: 16.0,
          ),
          Text(
            "We also talk about the future of work as the robots advance, and we ask whether a retro phone",
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _drawCardFooter() {
    return Column(
      children: <Widget>[
        Divider(
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.repeat),
                      color: Colors.orange,
                      onPressed: () {}),
                  Text(
                    "25",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      "SHARE",
                      style: TextStyle(color: Colors.orange),
                    ),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text(
                      "OPEN",
                      style: TextStyle(color: Colors.orange),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
