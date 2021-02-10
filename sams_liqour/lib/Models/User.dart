import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class UserModel {
  static const EMAIL = 'email';
  static const NAME = 'name';
  static const UID = 'uid';
  static const STRIPE_ID = 'stripeId';

  String _email;
  String _uid;
  String _name;
  String _stripeId;

  String get email => _email;
  String get id => _uid;
  String get name => _name;
  String get stripeId => _stripeId;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _uid = snapshot.data()[UID];
    _stripeId = snapshot.data()[STRIPE_ID] ?? "";
  }
}
