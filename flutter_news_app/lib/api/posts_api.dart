import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_news_app/models/post.dart';
import 'package:flutter_news_app/utilities/api_utilities.dart';

class PostsApi {
  String url;
  Post post;
  List<Post> postsList;

  Future<List<Post>> fetchCategoriesById(String id) async {
    url = base_url + categories_url + id;
    postsList = List<Post>();

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];

      for (var item in data) {
        post = Post(
          id: item["id"].toString(),
          title: item["title"].toString(),
          content: item["content"].toString(),
          date_written: item["date_written"].toString(),
          featured_image: item["featured_image"].toString(),
          votes_up: item["votes_up"],
          votes_down: item["votes_down"],
          voters_up: (item["voters_up"] == null)
              ? List<int>()
              : jsonDecode(item["voters_up"]),
          voters_down: (item["voters_down"] == null)
              ? List<int>()
              : jsonDecode(item["voters_down"]),
          user_id: item["user_id"],
          category_id: item["category_id"],
        );
        postsList.add(post);
      }
    }
    return postsList;
  }
}
