import 'package:flutter_shop_app/product/base_product.dart';

class ProductController {
  BaseProduct product;

  ProductController(this.product);

  static List<BaseProduct> toProducts(List<Map<String, dynamic>> jsonObject) {}
}
