import 'dart:convert';

import 'package:hacker_news/src/api/repository.dart';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:http/http.dart' show Client;

String baseUrl = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source {
  Client client = Client();

  @override
  Future<List<int>> fetchTopIds() async {
    String url = baseUrl + '/topstories.json';
    final response = await client.get(url);
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    String url = baseUrl + '/item/$id.json';
    final response = await client.get(url);
    final parsedJson = json.decode(response.body);
    ItemModel item = ItemModel.fromJson(parsedJson);
    return item;
  }
}
