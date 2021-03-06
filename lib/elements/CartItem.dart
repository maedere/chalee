import 'dart:ui';

import 'package:chalee/model/json/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatefulWidget {

  final ProductModel model;

  CartItem({@required this.model});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
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

            Image.network(widget.model.image,height: 80,width: 80,),

            SizedBox(
              width: 5,
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(widget.model.name),
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
                  (widget.model.price-widget.model.discount*widget.model.price/100).toStringAsFixed(2),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                Padding(padding: EdgeInsets.all(15),child: Text(widget.model.count.toString() , textAlign: TextAlign.center,)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
