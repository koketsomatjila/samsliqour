// import 'package:flutter/material.dart';
// import 'package:sams_liqour/Pages/Product Details.dart';

// class Products extends StatefulWidget {
//   @override
//   _ProductsState createState() => _ProductsState();
// }

// class _ProductsState extends State<Products> {
//   var productList = [
//     {
//       "name": "Heineken 340ml",
//       "picture": "images/products/beers/heineken.jpg",
//       "price": "R10",
//     },
//     {
//       "name": "Hennessy VSOP 750ml",
//       "picture": "images/products/spirits/Hennessy.png",
//       "price": "R450",
//     },
//     {
//       "name": "Gordons Dry Gin 750ml",
//       "picture": "images/products/spirits/gordons.jpeg",
//       "price": "R110",
//     },
//     {
//       "name": "4th Street Wine 5lt",
//       "picture": "images/products/wines/4thstreet.jpeg",
//       "price": "R250",
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         itemCount: productList.length,
//         gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemBuilder: (BuildContext context, int index) {
//           return SingleProduct(
//             productName: productList[index]['name'],
//             productPicture: productList[index]['picture'],
//             productPrice: productList[index]['price'],
//           );
//         });
//   }
// }

// class SingleProduct extends StatelessWidget {
//   final productName;
//   final productPicture;
//   final productPrice;

//   SingleProduct({
//     this.productName,
//     this.productPicture,
//     this.productPrice,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Hero(
//         tag: productName,
//         child: Material(
//           child: InkWell(
//             onTap: () => Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => ProductDetails(
//                   productDetailName: productName,
//                   productDetailPicture: productPicture,
//                   productDetailPrice: productPrice,
//                 ),
//               ),
//             ),
//             child: GridTile(
//               child: Image.asset(productPicture, fit: BoxFit.cover),
//               footer: Container(
//                 height: 60,
//                 color: Colors.white70,
//                 child: ListTile(
//                   title: Text(
//                     productName,
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
//                   ),
//                   subtitle: Text(productPrice,
//                       style: TextStyle(
//                           color: Colors.red, fontWeight: FontWeight.bold)),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
