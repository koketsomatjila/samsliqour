import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sams_liqour/Models/User.dart';

class UserServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "users";

  void createUser(Map data) {
    _firestore.collection(collection).doc(data["uid"]).set(data);
  }

  Future<UserModel> getUserById(String uid) => _firestore
      .collection(collection)
      .doc(uid)
      .get()
      .then((doc) => UserModel.fromSnapshot(doc));
}
