import 'package:flutter/material.dart';
import 'package:login_bloc_section14/src/models/product.dart';
import 'package:login_bloc_section14/src/views/screens/login_screen.dart';
import 'package:login_bloc_section14/src/views/screens/product_details.dart';
import 'package:login_bloc_section14/src/views/screens/products_screen.dart';
import 'package:login_bloc_section14/src/views/undefined_view.dart';
import './constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case productsRoute:
        return MaterialPageRoute(builder: (_) => ProductsScreen());
      case productDetailsRoute:
        Product product = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => ProductDetails(product.title, product.qty));
      default:
        return MaterialPageRoute(
            builder: (context) => UndefinedView(
                  name: settings.name,
                ));
    }
  }
}
