import 'package:flutter/material.dart';
import '../Models/order.dart';
import 'package:provider/provider.dart';
import 'package:sams_liqour/Models/order.dart';
import 'package:sams_liqour/Provider/User%20Provider.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Orders"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: user.orders.length,
          itemBuilder: (_, index) {
            OrderModel _order = user.orders[index];
            return ListTile(
              leading: Text(
                "R${_order.total}",
              ),
              title: Text(_order.description),
              subtitle: Text(
                  DateTime.fromMillisecondsSinceEpoch(_order.createdAt)
                      .toString()),
              trailing: Text(_order.status),
            );
          }),
      bottomNavigationBar: FlatButton(
        child: Text('Clear Orders List'),
        color: Colors.red,
        textColor: Colors.white,
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }
}
