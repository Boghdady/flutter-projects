import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/posts_api.dart';
import 'package:flutter_news_app/models/post.dart';
import 'package:flutter_news_app/utilities/data_utilities.dart';

import '../post_details.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  PostsApi _postsApi = PostsApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _postsApi.fetchCategoriesById("2"),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return connectionError();
            break;
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.active:
            return loading();
            break;
          case ConnectionState.done:
            if (snapshot.hasError) {
              return error(snapshot.error);
            } else {
              List<Post> posts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return _drawCardItem(posts[position]);
                },
                itemCount: posts.length,
              );
            }
        }
      },
    );
  }

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
              Image(
                width: 130,
                height: 130,
                image: NetworkImage(post.featured_image),
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Column(
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
}
