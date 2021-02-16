import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sams_liqour/Models/Cart%20Item.dart';
import 'package:sams_liqour/Models/Product.dart';
import 'package:sams_liqour/Models/User.dart';
import 'package:uuid/uuid.dart';

class UserServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "users";

  void createUser(Map<String, dynamic> data) {
    String uid = data['uid'];
    _firestore.collection(collection).doc(uid).set(data);
  }

  void updateUserData(Map<String, dynamic> data) {
    _firestore.collection(collection).doc(data['id']).update(data);
  }

  Future<UserModel> getUserById(String uid) => _firestore
      .collection(collection)
      .doc(uid)
      .get()
      .then((doc) => UserModel.fromSnapshot(doc));

  void addToCart({String userId, CartItemModel cartItem}) {
    print("THE USER ID IS: $userId");
    print("cart items are: ${cartItem.toString()}");
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({String userId, CartItemModel cartItem}) {
    print("THE USER ID IS: $userId");
    print("cart items are: ${cartItem.toString()}");
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }
}
