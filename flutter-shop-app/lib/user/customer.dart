import 'package:flutter_shop_app/order/base_order.dart';
import 'package:flutter_shop_app/order/order_controller.dart';
import 'package:flutter_shop_app/product/base_product.dart';
import 'package:flutter_shop_app/product/product_controller.dart';
import 'package:flutter_shop_app/user/address.dart';
import 'package:flutter_shop_app/user/user.dart';

class Customer extends User {
  Address shippingAddress;
  Address billingAddress;
  List<BaseOrder> orders;
  List<BaseProduct> watchList;

  Customer(
    String id,
    String firstName,
    String lastName,
    String email,
    String phone,
    String gender,
    this.shippingAddress,
    this.billingAddress,
    this.orders,
    this.watchList,
  ) : super(id, firstName, lastName, email, phone, gender);

  Customer.fromJson(Map<String, dynamic> jsonObject)
      : super(
          jsonObject['id'],
          jsonObject['first_name'],
          jsonObject['last_name'],
          jsonObject['emial'],
          jsonObject['phone'],
          jsonObject['gender'],
        ) {
    this.billingAddress = Address.fromJson(jsonObject['shipping_address']);
    this.billingAddress = Address.fromJson(jsonObject['billing_address']);
    this.orders = OrderController.toOrders(jsonObject['orders']);
    this.watchList = ProductController.toProducts(jsonObject['watch_list']);
  }
}
