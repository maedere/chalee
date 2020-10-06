import 'dart:ui';

import 'package:chalee/model/json/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartFav extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartFav> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      margin: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        height: 300.h,
        child: Row(
          children: [
            Image(
              image: AssetImage("assets/images/es.png"),
              width: 80,
              height: 80,
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("test item 1"),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "idont know ",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Text(
                  "\$10  ",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
