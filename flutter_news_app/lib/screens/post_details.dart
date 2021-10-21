import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/post.dart';

class PostDetails extends StatefulWidget {
  final Post post;
  // constructor
  PostDetails(this.post);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.red.shade800,
              pinned: true,
              floating: false,
              expandedHeight: MediaQuery.of(context).size.height * .35,
              actions: <Widget>[
                IconButton(icon: Icon(Icons.share), onPressed: () {}),
                IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: _sliverAppBarContent(),
              ),
            ),
          ];
        },
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _bodyContent(),
                    Divider(
                      color: Colors.grey,
                    ),
                    _commentTxt(),
                    _comment(),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                    _comment(),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                    _comment(),
                  ],
                ),
              ),
            ),
            _writeComment(),
          ],
        ),
      ),
    );
  }

  // 1- header (SliverAppBar)
  Widget _sliverAppBarContent() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(widget.post.featured_image), fit: BoxFit.cover),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 24.0, bottom: 32.0, right: 64, top: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 32,
                  height: 32,
                  child: CircleAvatar(
                    backgroundColor: Colors.pinkAccent.shade200,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Michael Adams",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "15 min",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Google AI Defeats Human Go Champions",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }

  // 2- body
  Widget _bodyContent() {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          Text(
            widget.post.content,
            style: TextStyle(
              height: 1.25,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: NetworkImage(widget.post.featured_image),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            widget.post.content,
            style: TextStyle(
              height: 1.25,
              color: Colors.grey.shade700,
            ),
          )
        ],
      ),
    );
  }

// 3- comment text
  Widget _commentTxt() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
      child: Text(
        "Comments (3)",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

// 4- footer (comments section)
  Widget _comment() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, bottom: 8.0, top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 32,
                height: 32,
                child: CircleAvatar(
                  backgroundColor: Colors.pinkAccent.shade200,
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Michael Adams",
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "1 hour",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable...",
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  // 5- write a comment footer
  Widget _writeComment() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 60,
            color: Colors.grey.shade200,
            child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 110),
              child: TextField(
                style: TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write comment here...'),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0, right: 16.0),
            child: FlatButton(
              child: Text(
                "SEND",
                style: TextStyle(
                  color: Colors.red.shade900,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
