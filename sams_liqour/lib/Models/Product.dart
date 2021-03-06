import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const CATEGORY = 'Category';
  static const FEATURED = 'Featured';
  static const ID = 'id';
  static const NAME = 'Name';
  static const PICTURE = 'Picture';
  static const PRICE = 'Price';
  static const QUANTITY = 'Quantity';
  static const SALE = 'sale';

  String _category;
  String _id;
  String _name;
  String _picture;
  double _price;
  int _quantity;
  bool _sale;
  bool _featured;

  String get category => _category;
  String get id => _id;
  String get name => _name;
  String get picture => _picture;
  double get price => _price;
  int get quantity => _quantity;
  bool get sale => _sale;
  bool get featured => _featured;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data();
    _category = data[CATEGORY];
    _id = data[ID];
    _name = data[NAME];
    _picture = data[PICTURE];
    _price = data[PRICE];
    _quantity = data[QUANTITY];
    _sale = data[SALE];
    _featured = data[FEATURED];
  }
}
