

import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryElement extends StatelessWidget{
  String id;
  String date;
  String price;
  OrderHistoryElement(this.id,this.date,this.price);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black.withOpacity(.6),spreadRadius: 1,blurRadius: 6)
          ]
      ),
      margin: EdgeInsets.symmetric(vertical: 20.h , horizontal: 30.w),
      padding: EdgeInsets.symmetric(vertical: 20.h , horizontal: 40.w),
      height: 150.h,
      child: Row(
        children: [
          Text(id ,style: TextStyle(color: ColorApp.primary , fontFamily: "main"),),
          Expanded(child: SizedBox(),),
          Column(
            children: [
              Text(price),
              Expanded(child: SizedBox()),
              Text(date , style: TextStyle(color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }

}