import 'dart:async';
import 'package:login_bloc_section14/src/blocs/provider.dart';
import 'package:login_bloc_section14/src/models/product.dart';

class ProductsBloc extends BlocBase {
  List<Product> productsList;

  // fetch products
  final StreamController<List<Product>> _productsController =
      StreamController<List<Product>>();
  // add product to products List stream
  StreamController<Product> _addProductController = StreamController<Product>();
  // delete product from products stream
  StreamController<Product> _removeProductController =
      StreamController<Product>();

  // Adding data to stream
  StreamSink<List<Product>> get productsListSink => _productsController.sink;
  StreamSink<Product> get addProductSink => _addProductController.sink;
  StreamSink<Product> get removeProductSink => _removeProductController.sink;

  // Retrieve data from stream
  Stream<List<Product>> get productsStream => _productsController.stream;

  void _removeProduct(Product product) {
    productsList.remove(product);
    productsListSink.add(productsList);
  }

  void _addProduct(Product product) {
    productsList.add(product);
    productsListSink.add(productsList);
  }

  void listen() {
    _addProductController.stream.listen(_addProduct);
    _removeProductController.stream.listen(_removeProduct);
  }

  void fetchProducts() async {
    //  wait for 2 seconds for testing
    await Future.delayed(const Duration(seconds: 2), () {});
    productsList = [
      Product('1', 'Product 1', 20),
      Product('2', 'Product 2', 30),
      Product('3', 'Product 3', 40),
      Product('4', 'Product 4', 50),
      Product('5', 'Product 5', 60),
      Product('6', 'Product 6', 70),
    ];
    productsListSink.add(productsList);
  }

  ProductsBloc() {
    fetchProducts();
    listen();
  }

  @override
  void dispose() {
    _productsController.close();
    _addProductController.close();
    _removeProductController.close();
  }
}
