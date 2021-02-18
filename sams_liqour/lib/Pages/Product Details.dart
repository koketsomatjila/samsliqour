import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sams_liqour/Commons/Loading.dart';
import 'package:sams_liqour/Components/Quantity.dart';
import 'package:sams_liqour/Models/Product.dart';
import 'package:sams_liqour/Provider/App.dart';
import 'package:sams_liqour/Provider/User%20Provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'Home.dart';
import 'package:sams_liqour/Pages/Shopping Cart.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;

  const ProductDetails({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        toolbarHeight: 130,
        flexibleSpace: Image(
          image: AssetImage('images/sams logo.jpg'),
          fit: BoxFit.fitWidth,
        ),
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Text(
            'samms \nliquoooor',
            style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.w900,
                color: Colors.transparent),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: null),
          IconButton(
              icon: Icon(Icons.shopping_bag, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cart(),
                  ),
                );
              })
        ],
      ),

      // body

      body: ListView(children: [
        Container(
          height: 300,
          child: GridTile(
            child: Container(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.product.picture,
                height: 50,
                width: 50,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),

        // buttons
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            child: ListTile(
                title: Column(children: [
              Expanded(
                child: Text(
                  widget.product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Expanded(
                child: Text(
                  'R${widget.product.price}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 20),
                ),
              )
            ])),
          ),
        ),
        Container(
          // decoration: BoxDecoration(boxShadow: [
          //   BoxShadow(
          //       color: Colors.black.withOpacity(0.2), offset: Offset(3, 2))
          // ]),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Quantity',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                      Container(
                        height: 50,
                        width: 100,
                        child: Quantity(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () async {
                    appProvider.changeIsLoading();
                    bool success = await userProvider.addToCart(
                      product: widget.product,
                    );
                    if (success) {
                      // ignore: deprecated_member_use
                      _key.currentState.showSnackBar(
                          SnackBar(content: Text("Added to Cart!")));
                      userProvider.reloadUserModel();
                      appProvider.changeIsLoading();
                      return;
                    } else {
                      // ignore: deprecated_member_use
                      _key.currentState.showSnackBar(
                          SnackBar(content: Text("NOT added to Cart!")));

                      appProvider.changeIsLoading();
                      return;
                    }
                  },
                  color: Colors.grey[800],
                  textColor: Colors.white,
                  elevation: 1,
                  child:
                      appProvider.isLoading ? Loading() : Text('Add To Cart'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 5),
              child: IconButton(
                icon: Icon(Icons.favorite_border_rounded, size: 30),
                color: Colors.grey[800],
                onPressed: () {},
              ),
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 28.0, top: 48),
        //   child: Text('Others also bought',
        //       style: TextStyle(fontWeight: FontWeight.w800)),
        // ),

        // Padding(
        //   padding: const EdgeInsets.all(28.0),
        //   child: Container(
        //     height: 380,
        //     child: OthersBought(),
        //   ),
        // ),
      ]),
    );
  }
}
