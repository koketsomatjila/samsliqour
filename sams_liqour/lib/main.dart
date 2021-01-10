import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:sams_liqour/Components/Horizontal List.dart';
import 'package:sams_liqour/Components/Products.dart';
import 'package:sams_liqour/Pages/Shopping Cart.dart';

//The main function is the starting point for all our flutter apps
void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = Container(
      height: 230.0,
      child: Carousel(
        boxFit: BoxFit.fitHeight,
        images: [
          AssetImage('images/carousel/Spirits.png'),
          AssetImage('images/carousel/Wines.png'),
          AssetImage('images/carousel/Beer-and-Cider.png'),
        ],
        autoplay: true,
        animationCurve: Curves.easeInOutCirc,
        animationDuration: Duration(milliseconds: 1000),
        dotColor: Colors.yellow,
        dotSize: 5,
        indicatorBgPadding: 3,
      ),
    );

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
      drawer: Drawer(
        child: ListView(
          children: [
//           start of the header
            UserAccountsDrawerHeader(
              accountName: Text('Koketso'),
              accountEmail: Text('ktmatjila@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: Image(
                  image: AssetImage('images/kk.jpg'),
                ),
              ),
              decoration: BoxDecoration(color: Colors.brown),
            ),
// start of the body
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_cart_rounded),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.dashboard_rounded),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Wishlist'),
                leading: Icon(Icons.favorite_border_rounded),
              ),
            ),

            Divider(
              height: 57,
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings_applications_rounded),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.help_rounded,
                ),
              ),
            ),
          ],
        ),
      ),

      // body

      body: Container(
        color: Colors.white54,
        child: ListView(
          children: [
            imageCarousel,
            Padding(
              padding: EdgeInsets.all(12),
              child: Text('Categories'),
            ),

            //horizontal list starts here

            HorizontalList(),

            //padding

            Padding(
              padding: EdgeInsets.only(top: 12, left: 12, bottom: 15),
              child: Text('Popular Items'),
            ),

            //popular items grid

            Container(
              height: 420,
              child: Products(),
            )
          ],
        ),
      ),
    );
  }
}
