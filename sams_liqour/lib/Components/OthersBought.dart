// import 'package:flutter/material.dart';
// import 'package:sams_liqour/Pages/Product%20Details.dart';

// class OthersBought extends StatefulWidget {
//   @override
//   _OthersBoughtState createState() => _OthersBoughtState();
// }

// class _OthersBoughtState extends State<OthersBought> {
//   var othersBoughtList = [
//     {
//       "name": "Castle Lite 340ml",
//       "picture": "images/products/beers/castlelite.jpg",
//       "price": "R10",
//     },
//     {
//       "name": "Schwepps Dry Lemon 1lt",
//       "picture": "images/products/colddrinks/drylemon.jpeg",
//       "price": "R15",
//     },
//     {
//       "name": "Belgravia Gin 750ml",
//       "picture": "images/products/spirits/belgravia.jpeg",
//       "price": "R110",
//     },
//     {
//       "name": "Carling Black Label 340ml",
//       "picture": "images/products/beers/carling.jpg",
//       "price": "R10",
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         itemCount: othersBoughtList.length,
//         gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemBuilder: (BuildContext context, int index) {
//           return SingleOthersBought(
//             othersBoughtName: othersBoughtList[index]['name'],
//             othersBoughtPicture: othersBoughtList[index]['picture'],
//             othersBoughtPrice: othersBoughtList[index]['price'],
//           );
//         });
//   }
// }

// class SingleOthersBought extends StatelessWidget {
//   final othersBoughtName;
//   final othersBoughtPicture;
//   final othersBoughtPrice;

//   SingleOthersBought({
//     this.othersBoughtName,
//     this.othersBoughtPicture,
//     this.othersBoughtPrice,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Hero(
//         tag: othersBoughtName,
//         child: Material(
//           child: InkWell(
//             onTap: () => Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => ProductDetails(
//                   productDetailName: othersBoughtName,
//                   productDetailPicture: othersBoughtPicture,
//                   productDetailPrice: othersBoughtPrice,
//                 ),
//               ),
//             ),
//             child: GridTile(
//               child: Image.asset(othersBoughtPicture, fit: BoxFit.cover),
//               footer: Container(
//                 height: 60,
//                 color: Colors.white70,
//                 child: ListTile(
//                   title: Text(
//                     othersBoughtName,
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
//                   ),
//                   subtitle: Text(othersBoughtPrice,
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
