import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsInCart = [
    {
      "name": "Hennessy VSOP 750ml",
      "picture": "images/products/spirits/Hennessy.png",
      "price": "R450",
      "quantity": 2,
    },
    {
      "name": "Heineken 340ml",
      "picture": "images/products/beers/heineken.jpg",
      "price": "R10",
      "quantity": 12,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productsInCart.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            cartProdName: productsInCart[index]["name"],
            cartProdPic: productsInCart[index]["picture"],
            cartProdPrice: productsInCart[index]["price"],
            cartProdQty: productsInCart[index]["quantity"],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProdName;
  final cartProdPic;
  final cartProdPrice;
  final cartProdQty;

  SingleCartProduct({
    this.cartProdName,
    this.cartProdPic,
    this.cartProdPrice,
    this.cartProdQty,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cartProdPic),
        title: Text(cartProdName),
        subtitle: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 14),
              child: Text(cartProdPrice),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: (cartProdQty),
            // ),
          ],
        ),
      ),
    );
  }
}
