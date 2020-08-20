import 'package:flutter/material.dart';
import 'package:flutter_app/model/product_model.dart';
import 'package:provider/provider.dart';
import 'model/cart_page.dart';
import 'pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String appTitle = "Phone Shop";
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductStructureProvider>(
          create: (context) => ProductStructureProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primarySwatch: Colors.red,
          backgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(title: appTitle),
      ),
    );
  }
}
