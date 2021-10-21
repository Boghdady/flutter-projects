import 'package:flutter/material.dart';
import 'package:login_bloc_section14/src/blocs/products_bloc.dart';
import 'package:login_bloc_section14/src/blocs/provider.dart';
import 'package:login_bloc_section14/src/models/product.dart';
import 'package:login_bloc_section14/src/views/widgets/products/list_item.dart';
import '../Observer.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ProductsBloc();
  }

  @override
  void dispose() {
    bloc?.dispose();
    super.dispose();
  }
  // BlocProvider<ProductsBloc>(

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            var _product = Product('10', 'New Products', 102);
            bloc.addProductSink.add(_product);
          },
          child: Icon(Icons.add),
        ),
        body: Observer(
          stream: bloc.productsStream,
          onSuccess: (BuildContext context, List<Product> data) {
            return ListView.separated(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListItem(
                  bloc: bloc,
                  products: data,
                  index: index,
                );
              },
              separatorBuilder: (context, int index) {
                return Divider(
                  height: 8.0,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
