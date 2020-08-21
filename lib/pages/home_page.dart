import 'package:flutter/material.dart';
import 'package:flutter_app/model/product_model.dart';
import 'package:flutter_app/widget/bottom_bar_widget.dart';
import 'package:flutter_app/widget/catalog_widget.dart';
import 'package:flutter_app/widget/item_card_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({this.title});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductStructureProvider>(context);

    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 85,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              )),
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: <Widget>[
              Container(
                child: ListTile(
                  title: Text(
                    "Smartphone's shop",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Choose your best one!",
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.panorama_horizontal),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productData.itemList.length,
                  itemBuilder: (context, int index) => ChangeNotifierProvider.value(
                    value: productData.itemList[index],
                    child: ItemCard(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Smartphone's catalog."),
              ),
              ...productData.itemList.map((e) =>
                  CatalogListTile(
                    title: e.title,
                    imgUrl: e.imageUrl,
                    rating: e.rating,
                  )).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
