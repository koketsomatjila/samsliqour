import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sams_liqour/Commons/Common.dart';
import 'package:sams_liqour/Models/Product.dart';
import 'package:sams_liqour/Pages/Product%20Details.dart';
import 'package:sams_liqour/Provider/Product%20Provider.dart';
import 'package:transparent_image/transparent_image.dart';

class PopularProduct extends StatelessWidget {
  final ProductModel product;

  const PopularProduct({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(-2, -1),
                  blurRadius: 5),
            ]),
        child: InkWell(
          onTap: () {
            changeScreenReplacement(
                context,
                ProductDetails(
                  product: product,
                ));
          },
          child: Row(
            children: <Widget>[
              _productImage(product.picture),

              // SizedBox(
              //   width: 30,
              // ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '${product.name} \n\n',
                    style: TextStyle(fontSize: 20),
                  ),
                  TextSpan(
                    text: 'R${product.price} \t',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  // TextSpan(
                  //   text: 'HOT RIGHT NOW',
                  //   style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w400,
                  //       color: Colors.red),
                  // ),
                ], style: TextStyle(color: Colors.black)),
              )
            ],
          ),
        ),
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
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: product.picture,
            height: 90,
            width: 90,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
