import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/cart_page.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartProvider>(context);
    final carItem = cartData.cartItems;

    return BottomAppBar(
      color: Colors.transparent,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.redAccent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2 + 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: carItem.length,
                itemBuilder: (context, index) => Hero(
                  tag: carItem.values.toList()[index].imgUrl,
                  child: GestureDetector(
                    onTap: () {},
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: 35,
                          height: 35,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 4,
                                  spreadRadius: 5,
                                  offset: Offset(-2, 2),
                                ),
                              ],
                              image: DecorationImage(
                                image: NetworkImage(
                                    carItem.values.toList()[index].imgUrl),
                                fit: BoxFit.contain,
                              )),
                        ),
                        Positioned(
                          right: 2,
                          bottom: 5,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            constraints: BoxConstraints(
                              maxHeight: 16,
                              maxWidth: 16,
                            ),
                            child: Text(
                              "${carItem.values.toList()[index].count}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2 - 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("${cartData.carItemCount.toStringAsFixed(2)}"),
                  IconButton(
                    icon: Icon(
                      Icons.shopping_basket,
                      color: Color(0xFF676E79),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
