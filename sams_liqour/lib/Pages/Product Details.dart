import 'package:flutter/material.dart';
import 'package:sams_liqour/Components/OthersBought.dart';
import 'package:sams_liqour/Components/Quantity.dart';
import 'Home.dart';
import 'package:sams_liqour/Pages/Shopping Cart.dart';

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailPicture;
  final productDetailPrice;

  ProductDetails({
    this.productDetailName,
    this.productDetailPicture,
    this.productDetailPrice,
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      body: ListView(
        children: [
          Container(
            height: 500,
            child: GridTile(
              child: Container(
                child: Image.asset(widget.productDetailPicture),
              ),
              footer: Container(
                height: 35,
                child: ListTile(
                  title: Column(
                    children: [
                      Expanded(
                        child: Text(
                          widget.productDetailName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.productDetailPrice,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // buttons

          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(context: null);
                    },
                    color: Colors.grey[100],
                    textColor: Colors.grey,
                    elevation: 1,
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          'Quantity',
                          textAlign: TextAlign.center,
                        )),
                        Container(
                          height: 50,
                          width: 100,
                          child: Quantity(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.grey[800],
                    textColor: Colors.white,
                    elevation: 1,
                    child: Text('Add To Cart'),
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
          Padding(
            padding: const EdgeInsets.only(left: 28.0, top: 48),
            child: Text('Others also bought',
                style: TextStyle(fontWeight: FontWeight.w800)),
          ),

          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Container(
              height: 380,
              child: OthersBought(),
            ),
          ),
        ],
      ),
    );
  }
}
