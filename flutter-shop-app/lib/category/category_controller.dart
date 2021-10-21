import 'package:flutter_shop_app/category/base_category.dart';

class CategoryController {
  BaseCategory category;

  CategoryController(this.category);

  static List<BaseCategory> toCategories(
      List<Map<String, dynamic>> jsonObject) {}
}
