
import 'package:chalee/model/json/Location.dart';
import 'package:chalee/model/json/ProductModel.dart';
import 'package:chalee/model/json/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constant{

  static LocationModel locationModel;

  static List<ProductModel> orders = [];

  static bool track = false;

  static User user;


  static Widget snak(String text) {
    return SnackBar(content: Container(
      //todo to 100dp
      height: 300.h,
      child: Center(child: Text(
        text, style: TextStyle(color: Colors.white, fontFamily: "main",),),),
    ),);
  }
}