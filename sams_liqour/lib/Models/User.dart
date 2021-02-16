import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sams_liqour/Models/Cart%20Item.dart';
// import 'package:provider/provider.dart';

class UserModel {
  static const EMAIL = 'email';
  static const NAME = 'name';
  static const UID = 'uid';
  static const STRIPE_ID = 'stripeId';
  static const CART = "cart";

  String _email;
  String _uid;
  String _name;
  String _stripeId;
  double _priceSum = 0;

  String get email => _email;
  String get id => _uid;
  String get name => _name;
  String get stripeId => _stripeId;

  List<CartItemModel> cart;
  double totalCartPrice;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _uid = snapshot.data()[UID];
    _stripeId = snapshot.data()[STRIPE_ID] ?? "";
    cart = _convertCartItems(snapshot.data()[CART] ?? []);
    totalCartPrice = snapshot.data()[CART] == null
        ? 0
        : getTotalPrice(cart: snapshot.data()[CART]);
  }
  List<CartItemModel> _convertCartItems(List cart) {
    List<CartItemModel> convertedCart = [];
    for (Map cartItem in cart) {
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }

  double getTotalPrice({List cart}) {
    if (cart == null) {
      return 0;
    }
    for (Map cartItem in cart) {
      _priceSum += cartItem["Price"];
    }

    double total = _priceSum;

    return total;
  }
}
