import 'dart:collection';

import 'package:flutter/foundation.dart';

class Cart {
  final String id, title, imgUrl;
  final num count, price;

  Cart({
      @required this.id,
      @required this.title,
      @required this.count,
      @required this.price,
      @required this.imgUrl
  });
}

class CartProvider with ChangeNotifier {
  Map<String, Cart> _cartItems = {};

  UnmodifiableMapView<String, Cart> get cartItems => UnmodifiableMapView(_cartItems);
  int get carItemCount => _cartItems.length;

  double get totalPrice {
    var total = 0.0;
    _cartItems.forEach((key, item) {
      total += item.price * item.count;
    });
    return total;
  }
  
  void addItem({product, price, title, imgUrl}) {
    if (_cartItems.containsKey(product)) {
      _cartItems.update(product, (ex) => Cart(
        id: ex.id,
        price: ex.price,
        title: ex.title,

        imgUrl: ex.imgUrl,
        count: ex.count + 1,
      ));
    } else {
      _cartItems.putIfAbsent(product, () => Cart(
        id: "${DateTime.now()}",
        price: price,
        title: title,
        imgUrl: imgUrl,
        count: 1,
      ));
    }
    notifyListeners();
  }

  void deleteItem(String product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  void updateCartAddItems(String product) {
    _cartItems.update(product, (ex) => Cart(
      id: ex.id,
      price: ex.price,
      title: ex.title,
      imgUrl: ex.imgUrl,
      count: ex.count + 1,
    ));
    notifyListeners();
  }

  void updateCartSubItems(String product) {
    if (_cartItems[product].count < 2) deleteItem(product);
    else _cartItems.update(product, (ex) => Cart(
      id: ex.id,
      price: ex.price,
      title: ex.title,
      imgUrl: ex.imgUrl,
      count: ex.count - 1,
    ));
    notifyListeners();
  }

  void clearCart() {
    _cartItems = {};
    notifyListeners();
  }
}
