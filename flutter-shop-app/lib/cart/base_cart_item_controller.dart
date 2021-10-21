import 'package:flutter_shop_app/cart/base_cart_item.dart';

class BaseCartItemController {
  BaseCartItem cartItem;

  BaseCartItemController(this.cartItem);

  static List<BaseCartItem> toCartItems(
      List<Map<String, dynamic>> jsonObject) {}
}
