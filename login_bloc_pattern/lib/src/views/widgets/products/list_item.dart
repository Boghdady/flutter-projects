import 'package:flutter/material.dart';
import 'package:login_bloc_section14/src/blocs/products_bloc.dart';
import 'package:login_bloc_section14/src/helpers/constants.dart';
import 'package:login_bloc_section14/src/models/product.dart';

class ListItem extends StatelessWidget {
  final ProductsBloc bloc;
  final List<Product> products;
  final int index;

  ListItem({this.bloc, this.products, this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(products[index].title),
          Text(products[index].qty.toString()),
        ],
      ),
      trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            bloc.removeProductSink.add(products[index]);
          }),
      onTap: () {
        Navigator.pushNamed(context, productDetailsRoute,
            arguments: products[index]);
      },
    );
  }
}
