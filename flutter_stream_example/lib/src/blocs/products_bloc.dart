import 'dart:async';
import 'package:flutter_stream/src/contracts/disposeable.dart';
import 'package:flutter_stream/src/models/product.dart';

class ProductsBloc implements Disposable {
  List<Product> products;

  // fetch products
  final StreamController<List<Product>> _productsController =
      StreamController<List<Product>>();
  Stream<List<Product>> get productsStream => _productsController.stream;
  StreamSink<List<Product>> get productsSink => _productsController.sink;

  // add product
  StreamController<Product> _addProductController = StreamController<Product>();
  StreamSink<Product> get addProduct => _addProductController.sink;

  void _addProduct(Product product) {
    products.add(product);
    productsSink.add(products);
  }

  // delete product
  StreamController<Product> _deleteProductController =
      StreamController<Product>();
  StreamSink<Product> get deleteProduct => _deleteProductController.sink;

  void _deleteProduct(Product product) {
    products.remove(product);
    productsSink.add(products);
  }

  ProductsBloc() {
    products = [
      Product('1', 'Prodcut1', 2),
      Product('2', 'Prodcut2', 3),
      Product('3', 'Prodcut3', 4),
    ];
    _productsController.add(products);
    _addProductController.stream.listen(_addProduct);
    _deleteProductController.stream.listen(_deleteProduct);
  }

  @override
  void dispose() {
    _productsController.close();
    _addProductController.close();
    _deleteProductController.close();
  }
}
