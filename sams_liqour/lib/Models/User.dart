import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const EMAIL = 'email';
  static const NAME = 'name';
  static const ID = 'id';
  static const STRIPE_ID = 'stripeId';

  String _email;
  String _id;
  String _name;
  String _stripeId;

  String get email => _email;
  String get id => _id;
  String get name => _name;
  String get stripeId => _stripeId;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data();
    _name = data[NAME];
    _email = data[EMAIL];
    _id = data[ID];
    _stripeId = data[STRIPE_ID] ?? "";
  }
}
