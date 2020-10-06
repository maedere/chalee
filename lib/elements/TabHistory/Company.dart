import 'package:chalee/elements/ProductMenu.dart';
import 'package:chalee/elements/ShopElement.dart';
import 'package:chalee/elements/shopEleFav.dart';
import 'package:flutter/material.dart';

class Company extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
       ShopEleFav(id: "0"),
       ShopEleFav(id: "0"),
       ShopEleFav(id: "0"),
       ShopEleFav(id: "0"),
       ShopEleFav(id: "0"),
       ShopEleFav(id: "0"),
       ShopEleFav(id: "0"),
      ],
    );
  }

}