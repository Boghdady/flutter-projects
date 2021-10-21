import 'package:flutter_shop_app/order/base_order.dart';

class OrderController {
  BaseOrder order;

  OrderController(this.order);

  static List<BaseOrder> toOrders(List<Map<String, dynamic>> jsonObject) {}
}
