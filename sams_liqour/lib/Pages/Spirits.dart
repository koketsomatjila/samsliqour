import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sams_liqour/Components/Popular%20Products.dart';
import 'package:sams_liqour/Provider/Product%20Provider.dart';
import 'Home.dart';

class Spirits extends StatefulWidget {
  @override
  _SpiritsState createState() => _SpiritsState();
}

class _SpiritsState extends State<Spirits> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                child: Text(
                  'Spirits',
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
            Column(
                children: productProvider.productsByCategory1
                    .map((item) => GestureDetector(
                          child: PopularProduct(
                            product: item,
                          ),
                        ))
                    .toList()),
          ],
        ),
      ),
    );
  }
}
