import 'package:flutter_shop_app/product_option/base_product_option.dart';

class ProductOptionController {
  BaseProductOption option;

  ProductOptionController(this.option);

  static List<BaseProductOption> toOptions(
      List<Map<String, dynamic>> jsonObject) {}
}
