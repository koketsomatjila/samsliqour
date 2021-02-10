import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sams_liqour/Models/Product.dart';
import 'package:sams_liqour/Provider/Product%20Provider.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
      child: Row(
        children: <Widget>[
          _productImage(product.picture),
          SizedBox(
            width: 10,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: '${product.name} \n',
                style: TextStyle(fontSize: 20),
              ),
              TextSpan(
                text: 'R${product.price} \t',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'HOT RIGHT NOW',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.red),
              ),
            ], style: TextStyle(color: Colors.black)),
          )
        ],
      ),
    );
  }

  _productImage(String picture) {
    if (picture == null) {
      return Container(child: Text("No Image"));
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            product.picture,
            height: 90,
            width: 70,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
