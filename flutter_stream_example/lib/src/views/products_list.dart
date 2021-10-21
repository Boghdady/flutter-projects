import 'package:flutter/material.dart';
import '../models/product.dart';
import '../blocs/products_bloc.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ProductsBloc productsBloc = ProductsBloc();

  @override
  void dispose() {
    productsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: productsBloc.productsStream,
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        print(snapshot.connectionState);
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(child: Text('Error'));
            }
            return Column(
              children: <Widget>[
                Flexible(
                  child: ListView.separated(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(snapshot.data[index].title),
                            Text(snapshot.data[index].qty.toString())
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            productsBloc.deleteProduct
                                .add(snapshot.data[index]);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        height: 8.0,
                      );
                    },
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Product product = Product('12', 'New Prouct', 879);
                    productsBloc.addProduct.add(product);
                  },
                  child: Text('Add Product'),
                ),
              ],
            );
            break;
          default:
            return CircularProgressIndicator();
        }
      },
    );
  }
}
