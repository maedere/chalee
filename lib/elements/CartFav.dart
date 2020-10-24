import 'dart:ui';

import 'package:chalee/model/json/ProductModel.dart';
import 'package:chalee/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartFav extends StatefulWidget {
   String goodId,goodName,goodPrice,shopName,goodImage,username,password;
   bool like=true;
   CartFav(this.goodId, this.goodName, this.goodPrice,
       this.shopName,this.goodImage,this.username,this.password);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartFav> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    if(widget.like)
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
        height:  300.h,
        child: Row(
          children: [
            Image.network(widget.goodImage,width: 80,height: 80,),
            SizedBox(
              width: 5,
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(widget.goodName),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.shopName,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Text(
                  "\$ ${widget.goodPrice}  ",
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
            IconButton(icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ), onPressed: (){
              deleteFavoriteGood(widget.username,widget.password,widget.goodId,_key);
              setState(() {
                widget.like=false;
              });
            })
          ],
        ),
      ),
    );
    else return Container(
      width: 0,
      height: 0,
    );
  }
}
