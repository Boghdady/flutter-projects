import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/posts_api.dart';
import 'package:flutter_news_app/models/post.dart';
import 'package:flutter_news_app/utilities/data_utilities.dart';

import '../post_details.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  PostsApi _postsApi = PostsApi();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FutureBuilder(
            future: _postsApi.fetchCategoriesById("1"),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return loading();
                  break;
                case ConnectionState.active:
                  return loading();
                  break;
                case ConnectionState.none:
                  return connectionError();
                  break;
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return error(snapshot.error);
                  } else {
                    List<Post> posts = snapshot.data;
                    if (posts.length > 3) {
                      Post post1 = snapshot.data[0];
                      Post post2 = snapshot.data[1];
                      Post post3 = snapshot.data[2];
                      Random random = Random();
                      Post randomPost = posts[random.nextInt(posts.length)];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _drawHeaderSection(randomPost),
                          _drawSectionText("Top Stories"),
                          _drawCardItem(post1),
                          _drawCardItem(post2),
                          _drawCardItem(post3),
                        ],
                      );
                    } else {
                      return noData();
                    }
                  }

                  break;
              }
            },
          ),
          _drawSectionText("Recent Update"),
          FutureBuilder(
            future: _postsApi.fetchCategoriesById("2"),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return loading();
                  break;
                case ConnectionState.active:
                  return loading();
                  break;
                case ConnectionState.none:
                  return connectionError();
                  break;
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return error(snapshot.error);
                  } else {
                    List<Post> posts = snapshot.data;
                    if (posts.length > 3) {
                      Post post1 = snapshot.data[0];
                      Post post2 = snapshot.data[1];

                      return Column(
                        children: <Widget>[
                          _drawRecentUpdateCardItem(Colors.deepOrange, post1),
                          _drawRecentUpdateCardItem(Colors.lightGreen, post2),
                          SizedBox(
                            height: 24,
                          ),
                        ],
                      );
                    } else {
                      return noData();
                    }
                  }
                  break;
              }
            },
          ),
        ],
      ),
    );
  }

  // 1- header section
  Widget _drawHeaderSection(Post post) {
    TextStyle _titleStyle = TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    );
    TextStyle _descriptionStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
    );
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PostDetails(post);
        }));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(post.featured_image),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 46.0, right: 46.0),
                child: Text(
                  post.title.trim(),
                  style: _titleStyle,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 34.0, right: 34.0),
                child: Text(
                  post.content.trim(),
                  style: _descriptionStyle,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 2- top sections text
  Widget _drawSectionText(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 4.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 3- draw top stories card
  Widget _drawCardItem(Post post) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PostDetails(post);
          }));
        },
        child: Card(
          elevation: 5,
          child: Row(
            children: <Widget>[
              Image.network(
                post.featured_image,
                fit: BoxFit.cover,
                width: 130,
                height: 130,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 2),
                      child: Text(
                        post.title.trim(),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Michael Adams",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              color: Colors.grey.shade700,
                            ),
                            Text(
                              parseHumanDateTime(post.date_written),
                              style: TextStyle(
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 4- draw Recent Update Card
  Widget _drawRecentUpdateCardItem(Color color, Post post) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PostDetails(post);
          }));
        },
        child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(post.featured_image),
                    fit: BoxFit.cover,
                  ),
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 24, right: 24, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "SPORT",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 16.0,
                  bottom: 8,
                  right: 8.0,
                ),
                child: Text(
                  "Vettel is Ferrari Number one - Hamilaton",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 8),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                    Text(
                      parseHumanDateTime(post.date_written),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 5- loading progress
//  Widget _loading() {
//    return Align(
//      alignment: Alignment.topCenter,
//      child: LinearProgressIndicator(
//        backgroundColor: Colors.grey,
//      ),
//    );
//  }

}
