import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sams_liqour/Database/order.dart';
import 'package:sams_liqour/Provider/App.dart';
import 'package:sams_liqour/Provider/User%20Provider.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  final _key = GlobalKey<ScaffoldState>();
  OrderServices _orderServices = OrderServices();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    return ListView.builder(
        itemCount: user.userModel.cart.length,
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    // app.changeIsLoading();
                    bool value = await user.removeFromCart(
                        cartItem: user.userModel.cart[index]);
                    if (value) {
                      user.reloadUserModel();
                      print("Item added to cart");
                      // ignore: deprecated_member_use
                      _key.currentState.showSnackBar(
                          SnackBar(content: Text("Removed from Cart!")));

                      return;
                    } else {
                      print("ITEM WAS NOT REMOVED");
                    }
                  }),
              leading: Image.network(user.userModel.cart[index].picture),
              title: Text(
                user.userModel.cart[index].name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              subtitle: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 14),
                    child: Text(
                        'R${user.userModel.cart[index].price}\t\t\t\t\t\t\t\t\t',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 14),
                    child: Text('Qty : ${user.userModel.cart[index].quantity}',
                        style: TextStyle(color: Colors.grey)),
                  )
                ],
              ),
            ),
          );
        });
  }
}
