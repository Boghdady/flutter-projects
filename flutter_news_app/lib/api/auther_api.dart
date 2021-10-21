import 'package:flutter_news_app/models/author.dart';
import 'package:flutter_news_app/utilities/api_utilities.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthorsApi {
  String url = base_url + all_authors_url;
  Author author;

  Future<List<Author>> fetchAllAuthor() async {
    List<Author> authorsList = List<Author>();
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      for (var item in data) {
        author = Author(item["id"].toString(), item["name"].toString(),
            item["email"].toString(), item["avatar"].toString());
        authorsList.add(author);
      }
    }
    return authorsList;
  }
}
