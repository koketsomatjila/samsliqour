// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sams_liqour/Database/Users.dart';
import 'package:sams_liqour/Database/order.dart';
import 'package:sams_liqour/Models/Cart%20Item.dart';
import 'package:sams_liqour/Models/Product.dart';
import 'package:sams_liqour/Models/User.dart';
import 'package:sams_liqour/Models/order.dart';
import 'package:uuid/uuid.dart';
// import 'package:provider/provider.dart';

enum Status { Uninitialised, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Status _status = Status.Uninitialised;
  UserServices _userServices = UserServices();
  UserModel _userModel;
  OrderServices _orderServices = OrderServices();
  List<OrderModel> orders = [];

  Status get status => _status;
  User get user => _user;
  UserModel get userModel => _userModel;

  final formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController confirm = TextEditingController();

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onStateChanged);
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((user) {
        _firestore.collection('users').doc(user.user.uid).set({
          "name": name.text,
          "email": email.text,
          "uid": user.user.uid,
          // "stripeId": ''
        });
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void clearController() {
    name.text = "";
    password.text = "";
    email.text = "";
    confirm.text = "";
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(user.uid);
    notifyListeners();
  }

  Future<void> _onStateChanged(User user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _userModel = await _userServices.getUserById(user.uid);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  Future<bool> addToCart({ProductModel product, int quantity}) async {
    try {
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List<CartItemModel> cart = _userModel.cart;
      Map cartItem = {
        "ID": cartItemId,
        "Name": product.name,
        "Picture": product.picture,
        "Product ID": product.id,
        "Price": product.price,
        "Quantity": product.quantity,
        "Category": product.category,
      };

      CartItemModel item = CartItemModel.fromMap(cartItem);
//
      print("CART ITEMS ARE: ${cart.toString()}");
      _userServices.addToCart(userId: _user.uid, cartItem: item);
//
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  getOrders() async {
    orders = await _orderServices.getUserOrders(userId: _user.uid);
    notifyListeners();
  }

  Future<bool> removeFromCart({CartItemModel cartItem}) async {
    print("THE PRODUC IS: ${cartItem.toString()}");

    try {
      _userServices.removeFromCart(userId: _user.uid, cartItem: cartItem);
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }
}
