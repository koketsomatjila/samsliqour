import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 150, 
      width: 15,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          
          Category( 
              imageLocation: 'images/categories/beers.png',
              imageCaption: '\nBeers & Ciders'),
          Category(
              imageLocation: 'images/categories/spiritss.png',
              imageCaption: '\nSpirits'),
          Category(
              imageLocation: 'images/categories/winess.png',
              imageCaption: '\nWines'),
          Category(
              imageLocation: 'images/categories/juice.png',
              imageCaption: '\nSoft Drinks & Juices'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({
    this.imageLocation,
    this.imageCaption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100,
          child: ListTile(
            title: Image.asset(imageLocation, width: 100, height: 70),
            subtitle: Container(
              width: 10,
              alignment: Alignment.topCenter,
              child: Text(imageCaption),
            ),
          ),
        ),
      ),
    );
  }
}
