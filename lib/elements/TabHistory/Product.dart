import 'package:chalee/elements/CartFav.dart';
import 'package:chalee/elements/ProductMenu.dart';
import 'package:chalee/model/json/GetOrder.dart';
import 'package:chalee/services/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Product extends StatefulWidget {

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  String username="";
  String password="";
  List<Goods> goods=[];
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    SharedPreferences sahredprfrenc;

    SharedPreferences.getInstance().then((prefs) {
      sahredprfrenc=prefs;
      getFavotitegood(sahredprfrenc.getString("username"),sahredprfrenc.getString("password"),
          _key).then((value){
        setState(() {
          username =(sahredprfrenc.getString("username"));
          password =(sahredprfrenc.getString("password"));
          goods=value;
        });
      });

    });

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  ListView(
      scrollDirection: Axis.vertical,
      children: addresse(),
    );
  }
  List<Widget> addresse() {
    List<Widget> list = List();
    //i<5, pass your dynamic limit as per your requirment
    for (final i in goods) {
      list.add(
        CartFav(i.id,i.shopName,i.price.toString(),
            i.shopName,i.imageUrl,username,password),
      );//add any Widget in place of Text("Index $i")
    }
    return list;// all widget added now retrun the list here
  }
}

