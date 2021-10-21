import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_news_app/models/category.dart';
import 'package:flutter_news_app/utilities/api_utilities.dart';

class CategoriesApi {
  String url;
  List<Category> categoriesList;
  Category category;

  Future<List<Category>> fetchCategories() async {
    url = base_url + all_categories_url;
    categoriesList = List<Category>();

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];

      for (var item in data) {
        category = Category(item["id"].toString(), item["title"].toString());
        categoriesList.add(category);
      }
    }

    return categoriesList;
  }
}
