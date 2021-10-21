import 'package:flutter_shop_app/order/base_order.dart';
import 'package:flutter_shop_app/product/base_product.dart';
import 'package:flutter_shop_app/user/customer.dart';

class CustomerController {
  Customer customer;
  List<BaseProduct> watchList;
  List<BaseOrder> orders;

  CustomerController(this.customer, this.watchList, this.orders);

  void addToWatchList(BaseProduct product) {
    this.customer.watchList.add(product);
  }

  void addToOrders(BaseOrder order) {
    this.customer.orders.add(order);
  }

  bool isProductInWatchList(BaseProduct product) {
    return this.customer.watchList.contains(product);
  }

  bool isOrderInOrders(BaseOrder order) {
    return this.customer.orders.contains(order);
  }

  bool removeProductFromWatchList(BaseProduct product) {
    return this.customer.watchList.remove(product);
  }
}
