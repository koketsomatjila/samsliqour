import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sams_liqour/Database/order.dart';
import 'package:sams_liqour/Models/Cart%20Item.dart';
import 'package:sams_liqour/Pages/order.dart';
import 'package:sams_liqour/Provider/App.dart';
import 'package:sams_liqour/Provider/User%20Provider.dart';
import 'package:uuid/uuid.dart';
import 'Home.dart';
import 'package:sams_liqour/Components/Cart Products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<ScaffoldState>();
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    OrderServices _orderServices = OrderServices();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        flexibleSpace: Image(
          image: AssetImage('images/sams logo.jpg'),
          fit: BoxFit.fitWidth,
        ),
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Text(
            'samms \nliquoooor',
            style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.w900,
                color: Colors.transparent),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: null),
          IconButton(
              icon: Icon(Icons.shopping_bag, color: Colors.white),
              onPressed: null)
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              child: Text(
                'Your Shopping Cart',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),
              width: 300,
              height: 50,
            ),
          ),
          Container(
            width: 1000,
            height: 371,
            child: CartProducts(),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text(
                    "Total:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[500],
                    ),
                  ),
                  subtitle: Text(
                    'R${user.userModel.totalCartPrice}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: MaterialButton(
                    onPressed: () {
                      if (user.userModel.totalCartPrice == 0) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20.0)), //this right here
                                child: Container(
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Your cart is emty',
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                        return;
                      }
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0)), //this right here
                              child: Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'You will be charged R${user.userModel.totalCartPrice} upon delivery!',
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 320.0,
                                        child: RaisedButton(
                                          onPressed: () async {
                                            var uuid = Uuid();
                                            String id = uuid.v4();
                                            _orderServices.createOrder(
                                                userId: user.user.uid,
                                                id: id,
                                                description:
                                                    "Some random description",
                                                status: "complete",
                                                totalPrice: user
                                                    .userModel.totalCartPrice,
                                                cart: user.userModel.cart);
                                            for (CartItemModel cartItem
                                                in user.userModel.cart) {
                                              bool value =
                                                  await user.removeFromCart(
                                                      cartItem: cartItem);
                                              if (value) {
                                                user.reloadUserModel();
                                                print("Item added to cart");
                                                _key.currentState.showSnackBar(
                                                    SnackBar(
                                                        content: Text(
                                                            "Removed from Cart!")));
                                              } else {
                                                print("ITEM WAS NOT REMOVED");
                                              }
                                            }
                                            _key.currentState.showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        "Order created!")));
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Accept",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          color: const Color(0xFF1BC0C5),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 320.0,
                                        child: RaisedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Reject",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Text(
                      "Checkout",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
