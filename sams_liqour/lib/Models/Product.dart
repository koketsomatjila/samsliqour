import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const CATEGORY = 'category';
  static const FEATURED = 'featured';
  static const ID = 'id';
  static const NAME = 'name';
  static const PICTURE = 'picture';
  static const PRICE = 'price';
  static const QUANTITY = 'quantity';
  static const SALE = 'sale';

  String _category;
  String _id;
  String _name;
  String _picture;
  int _price;
  int _quantity;
  bool _sale;
  bool _featured;

  String get category => _category;
  String get id => _id;
  String get name => _name;
  String get picture => _picture;
  int get price => _price;
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
