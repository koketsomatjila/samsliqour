import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:sams_liqour/Components/Cart Products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        flexibleSpace: Image(
          image: AssetImage('images/sams logo.JPG'),
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
              onPressed: null)
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              child: Text(
                'Your Shopping Cart',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),
              width: 300,
              height: 50,
            ),
          ),
          Container(
            width: 1000,
            height: 371,
            child: CartProducts(),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text(
                    "Total:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    ),
                  ),
                  subtitle: Text(
                    "R550",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Checkout",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
