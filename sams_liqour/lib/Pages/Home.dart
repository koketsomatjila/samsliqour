import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';
import 'package:sams_liqour/Commons/Common.dart';
import 'package:sams_liqour/Components/Horizontal List.dart';
import 'package:sams_liqour/Components/Popular%20Products.dart';
import 'package:sams_liqour/Models/Product.dart';
import 'package:sams_liqour/Pages/Beers.dart';
import 'package:sams_liqour/Pages/Categories.dart';
import 'package:sams_liqour/Pages/Product%20Details.dart';
import 'package:sams_liqour/Pages/Search.dart';
// import 'package:sams_liqour/Components/Products.dart';
import 'package:sams_liqour/Pages/Shopping Cart.dart';
import 'package:sams_liqour/Pages/Soft%20Drinks.dart';
import 'package:sams_liqour/Pages/Spirits.dart';
import 'package:sams_liqour/Pages/Wines.dart';
import 'package:sams_liqour/Pages/order.dart';
import 'package:sams_liqour/Provider/Product%20Provider.dart';
import 'package:sams_liqour/Provider/User%20Provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    Widget imageCarousel = Container(
      height: 170.0,
      child: Carousel(
        boxFit: BoxFit.contain,
        images: [
          AssetImage('images/carousel/Spirits.png'),
          AssetImage('images/carousel/Wines.png'),
          AssetImage('images/carousel/Beer-and-Cider.png'),
        ],
        autoplay: true,
        animationCurve: Curves.easeInOutCirc,
        animationDuration: Duration(milliseconds: 2000),
        dotColor: Colors.yellow,
        dotSize: 5,
        indicatorBgPadding: 3,
      ),
    );

    return Scaffold(
      key: key,
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
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                changeScreen(context, SearchPage());
                // showSearch(context: context, delegate: DataSearch());
              }),
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
              accountName: Text(userProvider.userModel.name),
              accountEmail: Text(userProvider.userModel.email),
              currentAccountPicture: GestureDetector(
                child: Image(
                  image: AssetImage('images/kk.jpg'),
                ),
              ),
              decoration: BoxDecoration(color: Colors.brown),
            ),
// start of the body
            // InkWell(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => HomePage(),
            //       ),
            //     );
            //   },
            //   child: ListTile(
            //     title: Text('Home Page'),
            //     leading: Icon(Icons.home),
            //   ),
            // ),
            // InkWell(
            //   onTap: () {},
            //   child: ListTile(
            //     title: Text('My Account'),
            //     leading: Icon(Icons.person),
            //   ),
            // ),

            InkWell(
              onTap: () {
                changeScreen(context, Categories());
              },
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.dashboard_rounded),
              ),
            ),
            InkWell(
              onTap: () async {
                await userProvider.getOrders();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrdersScreen(),
                  ),
                );
              },
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_cart_rounded),
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
                title: Text('About'),
                leading: Icon(
                  Icons.help_rounded,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                userProvider.signOut();
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

      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  imageCarousel,
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 20),
                    child: Text('Categories'),
                  ),

                  //horizontal list starts here
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(1),
                          child: InkWell(
                            onTap: () {
                              changeScreen(context, Beers());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 130,
                              child: ListTile(
                                title: Image.asset(
                                  'images/categories/beers.png',
                                  height: 50,
                                ),
                                subtitle: Container(
                                  alignment: Alignment.topCenter,
                                  child: Text('\nBeers/Ciders'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1),
                          child: InkWell(
                            onTap: () {
                              changeScreen(context, Spirits());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 130,
                              child: ListTile(
                                title: Image.asset(
                                  'images/categories/spiritss.png',
                                  height: 50,
                                ),
                                subtitle: Container(
                                  alignment: Alignment.topCenter,
                                  child: Text('\nSpirits'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1),
                          child: InkWell(
                            onTap: () {
                              changeScreen(context, Wines());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 130,
                              child: ListTile(
                                title: Image.asset(
                                  'images/categories/winess.png',
                                  height: 50,
                                ),
                                subtitle: Container(
                                  alignment: Alignment.topCenter,
                                  child: Text('\nWines'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1),
                          child: InkWell(
                            onTap: () {
                              changeScreen(context, SoftDrinks());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 130,
                              child: ListTile(
                                title: Image.asset(
                                  'images/categories/juice.png',
                                  height: 50,
                                ),
                                subtitle: Container(
                                  alignment: Alignment.topCenter,
                                  child: Text('\nSoft Drinks'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // HorizontalList(),

                  //padding

                  Padding(
                    padding: EdgeInsets.only(top: 35, bottom: 15),
                    child: Text('Popular Items'),
                  ),

                  //popular items grid

                  Column(
                      children: productProvider.featuredProducts
                          .map((item) => GestureDetector(
                                child: PopularProduct(
                                  product: item,
                                ),
                              ))
                          .toList()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class DataSearch extends SearchDelegate<String> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//           icon: Icon(Icons.clear),
//           onPressed: () {
//             query = '';
//           })
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//         icon: AnimatedIcon(
//             icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
//         onPressed: () {
//           close(context, null);
//         });
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('products').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: Text('No Data'),
//             );
//           }
//           return Center(
//               child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Icon(Icons.search),
//               Text(
//                 'No Data Found',
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ));
//         });
//   }
// }
