import 'package:flutter/material.dart';
// import '../Pages/Beers.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Category(
            imageLocation: 'images/categories/beers.png',
            imageCaption: '\nBeers/Ciders'),
        Category(
            imageLocation: 'images/categories/spiritss.png',
            imageCaption: '\nSpirits'),
        Category(
            imageLocation: 'images/categories/winess.png',
            imageCaption: '\nWines'),
        Category(
            imageLocation: 'images/categories/juice.png',
            imageCaption: '\nSoft Drinks'),
      ],
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
      padding: EdgeInsets.all(1),
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          width: 130,
          child: ListTile(
            title: Image.asset(
              imageLocation,
              height: 50,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(imageCaption),
            ),
          ),
        ),
      ),
    );
  }
}
