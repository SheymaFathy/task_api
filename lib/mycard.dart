import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom items.dart';

class MyCard extends StatelessWidget {
  String name;
  String description;
  String img;
  String price;
  MyCard(this.name,this.description,this.price,this.img);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(12, 13, 101, 0.85),
        title: Text('Details'),
      ),
      body: ProductDetail(img, name, description, price),
    );
  }
}
