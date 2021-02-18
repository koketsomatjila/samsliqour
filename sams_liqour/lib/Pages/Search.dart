import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sams_liqour/Commons/Common.dart';
import 'package:sams_liqour/Components/Popular%20Products.dart';
import 'package:sams_liqour/Pages/Home.dart';
import 'package:sams_liqour/Pages/Product%20Details.dart';
import 'package:sams_liqour/Provider/App.dart';
import 'package:sams_liqour/Provider/Product%20Provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                changeScreen(context, HomePage());
              }),
          title: Text("Products"),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Container()
        // productProvider.productsSearched.length < 1
        // ? Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Icon(
        //         Icons.search,
        //         color: Colors.grey,
        //         size: 30,
        //       ),
        //       Container(
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.only(
        //                 bottomRight: Radius.circular(20),
        //                 bottomLeft: Radius.circular(20))),
        //         child: Padding(
        //           padding: const EdgeInsets.only(
        //               top: 8, left: 8, right: 8, bottom: 10),
        //           child: Container(
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(20),
        //             ),
        //             child: SizedBox(
        //               height: 100,
        //               child: ListTile(
        //                 leading: Icon(
        //                   Icons.search,
        //                 ),
        //                 title: TextField(
        //                   textInputAction: TextInputAction.search,
        //                   // onSubmitted: (pattern) async {
        //                   //   appProvider.changeIsLoading();
        //                   //   if (appProvider.search == SearchBy.PRODUCTS) {
        //                   //     await productProvider.search(
        //                   //         productName: pattern);
        //                   //   } else {}
        //                   //   appProvider.changeIsLoading();
        //                   // },
        //                   decoration: InputDecoration(
        //                     hintText: "Heineken, Coroner, etc..",
        //                     border: InputBorder.none,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 15,
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: <Widget>[
        //           Text("No products Found"),
        //         ],
        //       )
        //     ],
        //   )
        // : ListView.builder(
        //     itemCount: productProvider.productsSearched.length,
        //     itemBuilder: (context, index) {
        //       return GestureDetector(
        //           onTap: () async {
        //             changeScreen(
        //                 context,
        //                 ProductDetails(
        //                     product:
        //                         productProvider.productsSearched[index]));
        //           },
        //           child: PopularProduct(
        //               product: productProvider.productsSearched[index]));
        //     }),
        );
  }
}
