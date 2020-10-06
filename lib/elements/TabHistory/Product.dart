import 'package:chalee/elements/CartFav.dart';
import 'package:chalee/elements/ProductMenu.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
       CartFav(),
       CartFav(),
       CartFav(),
      ],
    );
  }

}