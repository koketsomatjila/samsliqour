import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';
import 'package:sams_liqour/Components/Horizontal List.dart';
import 'package:sams_liqour/Components/Products.dart';
import 'package:sams_liqour/Pages/Shopping Cart.dart';
import 'package:sams_liqour/Provider/User%20Provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    Widget imageCarousel = Container(
      height: 150.0,
      child: Carousel(
        boxFit: BoxFit.contain,
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
            InkWell(
              onTap: () {
                user.signOut();
              },
              child: ListTile(
                title: Text('Log Out'),
                leading: Icon(
                  Icons.exit_to_app,
                ),
              ),
            ),
          ],
        ),
      ),

      // body

      body: Column(
        children: [
          imageCarousel,
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 20),
            child: Text('Categories'),
          ),

          //horizontal list starts here

          HorizontalList(),

          //padding

          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text('Popular Items'),
          ),

          //popular items grid

          Container(
            height: 200,
            child: Products(),
          ),
        ],
      ),
    );
  }
}
