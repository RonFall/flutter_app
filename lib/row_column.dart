import 'package:flutter/material.dart';

class MyRowColumn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unmei bar name"),
      ),
      body: Container(
        color: Colors.grey,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}

class ColorBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.redAccent[700],
        border: Border.all()
      ),
    );
  }
}

class BaseColorBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.redAccent[700],
          border: Border.all()
      ),
    );
  }
}