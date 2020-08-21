import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatalogListTile extends StatelessWidget {

  final imgUrl, title, rating;

  const CatalogListTile({Key key, this.imgUrl, this.title, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("09:00 - 21:00"),
              Row(
                children: <Widget>[
                  Icon(Icons.star, size: 20, color: Colors.amber,),
                  Text(rating),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}