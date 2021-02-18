import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sams_liqour/Commons/Common.dart';
import 'package:sams_liqour/Components/Popular%20Products.dart';
import 'package:sams_liqour/Pages/Beers.dart';
import 'package:sams_liqour/Pages/Soft%20Drinks.dart';
import 'package:sams_liqour/Pages/Spirits.dart';
import 'package:sams_liqour/Pages/Wines.dart';
import 'package:sams_liqour/Provider/Product%20Provider.dart';
import 'Home.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
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
              onPressed: null)
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              child: Text(
                'Categories',
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
          Flexible(
            child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: [
                Padding(
                  padding: EdgeInsets.all(1),
                  child: InkWell(
                    onTap: () {
                      changeScreenReplacement(context, Beers());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 130,
                      child: ListTile(
                        title: Image.asset(
                          'images/categories/beers.png',
                          height: 70,
                        ),
                        subtitle: Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '\nBeers/Ciders',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1),
                  child: InkWell(
                    onTap: () {
                      changeScreenReplacement(context, Spirits());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 130,
                      child: ListTile(
                        title: Image.asset(
                          'images/categories/spiritss.png',
                          height: 70,
                        ),
                        subtitle: Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '\nSpirits',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1),
                  child: InkWell(
                    onTap: () {
                      changeScreenReplacement(context, Wines());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 130,
                      child: ListTile(
                        title: Image.asset(
                          'images/categories/winess.png',
                          height: 70,
                        ),
                        subtitle: Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '\nWines',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1),
                  child: InkWell(
                    onTap: () {
                      changeScreenReplacement(context, SoftDrinks());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 130,
                      child: ListTile(
                        title: Image.asset(
                          'images/categories/juice.png',
                          height: 70,
                        ),
                        subtitle: Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '\nSoft Drinks',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
