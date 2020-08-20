import 'dart:collection';

import 'package:flutter/foundation.dart';

class CartPage {
  final String title, imgUrl;
  final num id, count, price;

  CartPage({
      @required this.id,
      @required this.title,
      @required this.count,
      @required this.price,
      @required this.imgUrl
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartPage> _cartItems = {};

  UnmodifiableMapView<String, CartPage> get cartItems => UnmodifiableMapView(_cartItems);
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
      _cartItems.update(product, (ex) => CartPage(
        id: ex.id,
        price: ex.price,
        title: ex.title,
        imgUrl: ex.imgUrl,
        count: ex.count + 1,
      ));
    } else {
      _cartItems.putIfAbsent(product, () => CartPage(
        id: 0,
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
    _cartItems.update(product, (ex) => CartPage(
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
    else _cartItems.update(product, (ex) => CartPage(
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
