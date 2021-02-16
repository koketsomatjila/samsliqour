import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  static const CATEGORY = 'Category';
  static const ID = 'ID';
  static const NAME = 'Name';
  static const PICTURE = 'Picture';
  static const PRODUCT_ID = 'Product ID';
  static const PRICE = 'Price';
  static const QUANTITY = 'Quantity';

  String _category;
  String _id;
  String _productId;
  String _name;
  String _picture;
  double _price;
  int _quantity;

  String get category => _category;
  String get id => _id;
  String get productId => _productId;
  String get name => _name;
  String get picture => _picture;
  double get price => _price;
  int get quantity => _quantity;

  CartItemModel.fromMap(Map data) {
    _category = data[CATEGORY];
    _id = data[ID];
    _productId = data[PRODUCT_ID];
    _name = data[NAME];
    _picture = data[PICTURE];
    _price = data[PRICE];
    _quantity = data[QUANTITY];
  }

  Map toMap() => {
        ID: _id,
        PICTURE: _picture,
        NAME: _name,
        PRODUCT_ID: _productId,
        QUANTITY: _quantity,
        PRICE: _price,
        CATEGORY: _category,
      };
}
