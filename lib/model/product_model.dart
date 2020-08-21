import 'dart:collection';

import 'package:flutter/material.dart';

class ProductStructure with ChangeNotifier {
  final String id, title, desc, imageUrl, rating;
  final num price;

  ProductStructure({
      @required this.id,
      @required this.title,
      @required this.price,
      @required this.desc,
      @required this.imageUrl,
      @required this.rating
  });
}

class ProductStructureProvider with ChangeNotifier {
  List<ProductStructure> _items = [
    ProductStructure(
        id: "1",
        title: "Huawei P40 lite",
        price: 143.71,
        desc: "Kirin 710F|64/4GB|Android 9.0|3 cam(48, 8, 2)MP|Dual SIM, LTE|4000mAh",
        imageUrl: "https://avatars.mds.yandex.net/get-mpic/1715800/img_id7736526023810301136.png/orig",
        rating: "5.0/5.0"
    ),
    ProductStructure(
        id: "2",
        title: "Xiaomi Mi 10 Lite",
        price: 368.53,
        desc: "Snapdragon 765 5G|128/8GB|Android 10.0|4 cam|Dual SIM, LTE|4160mAh",
        imageUrl: "https://avatars.mds.yandex.net/get-mpic/1866164/img_id2223120801931420568.jpeg/orig",
        rating: "5.0/5.0"
    ),
    ProductStructure(
        id: "3",
        title: "Xiaomi Redmi Note 9",
        price: 184.81,
        desc: "Helio G85|128/4GB|Android 9.0|4 cam|Dual SIM, LTE|5020mAh",
        imageUrl: "https://avatars.mds.yandex.net/get-mpic/1567763/img_id1525070543162363165.jpeg/orig",
        rating: "4.9/5.0"
    ),
    ProductStructure(
        id: "4",
        title: "ZTE Blade V2020",
        price: 190.98,
        desc: "Helio P70|128/4GB|Android 10.0|4 cam|Dual SIM, LTE|4000mAh",
        imageUrl: "https://avatars.mds.yandex.net/get-mpic/2014136/img_id8564407779608304970.jpeg/orig",
        rating: "4.0/5.0"
    ),
    ProductStructure(
        id: "5",
        title: "Samsung Galaxy A51",
        price: 273.86,
        desc: "Exynos 9611|64/4GB|Android 10.0|4 cam(48, 12, 5, 5)MP|Dual SIM, LTE|4000mAh",
        imageUrl: "https://avatars.mds.yandex.net/get-mpic/1626700/img_id7735018695857307227.jpeg/orig",
        rating: "4.6/5.0"
    ),
    ProductStructure(
        id: "6",
        title: "VIVO V17",
        price: 232.76,
        desc: "Snapdragon 665|128/8GB|Android 9.0|4 cam(48, 8, 2, 2)MP|Dual SIM, LTE|4500mAh",
        imageUrl: "https://avatars.mds.yandex.net/get-mpic/1924204/img_id8759791513859891330.png/orig",
        rating: "4.6/5.0"
    ),
    ProductStructure(
        id: "7",
        title: "Apple iPhone 11",
        price: 890.36,
        desc: "A13 Bionic|128/4GB|iOS 13.0|2 cam(12, 12)MP|Dual SIM, LTE|3110mAh",
        imageUrl: "https://avatars.mds.yandex.net/get-mpic/1862701/img_id8303576135959179156.png/orig",
        rating: "4.6/5.0"
    ),
  ];

  UnmodifiableListView<ProductStructure> get itemList => UnmodifiableListView(_items);
  ProductStructure getElementByID(String id) => _items.singleWhere((element) => element.id == id);
}
