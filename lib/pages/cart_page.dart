import 'package:flutter/material.dart';
import 'package:flutter_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Cart smart"),
        ),
        body: cartData.cartItems.isEmpty
            ? Card(
                elevation: 5,
                margin: const EdgeInsets.all(30),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: Text("Cart is empty"),
                ),
              )
            : Column(
                children: <Widget>[
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Price: " + cartData.totalPrice.toStringAsFixed(2),
                        style: TextStyle(fontSize: 20),
                      ),
                      MaterialButton(
                        onPressed: () {
                          cartData.clearCart();
                        },
                        color: Colors.redAccent,
                        child: Text("Buy"),
                      ),
                    ],
                  ),
                  Divider(),
                ],
              ));
  }
}
