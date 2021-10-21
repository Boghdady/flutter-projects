import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String title;
  final int qty;

  ProductDetails(this.title, this.qty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(title),
          Text('$qty'),
        ],
      ),
    );
  }
}
