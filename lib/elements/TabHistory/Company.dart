import 'package:chalee/elements/ProductMenu.dart';
import 'package:chalee/elements/ShopElement.dart';
import 'package:chalee/elements/TabDetail/menu.dart';
import 'package:chalee/elements/shopEleFav.dart';
import 'package:chalee/model/json/ShopModel.dart';
import 'package:chalee/screens/ShopDetailActiivty.dart';
import 'package:chalee/services/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

class Company extends StatefulWidget {
   List <Shop> shops=[];

  @override
  _CompanyState createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  @override
  void initState()
  {
    SharedPreferences sahredprfrenc;

    SharedPreferences.getInstance().then((prefs) {
      sahredprfrenc=prefs;
      getFavotiteshop(sahredprfrenc.getString("username"),sahredprfrenc.getString("password"),
          _key).then((value){
        setState(() {
          username =(sahredprfrenc.getString("username"));
          password =(sahredprfrenc.getString("password"));
          widget.shops=value;
        });
      });

    });

  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: company(),
    );
  }
  List<Widget> company() {
    List<Widget> list = List();
    //i<5, pass your dynamic limit as per your requirment
    for (final i in widget.shops) {
      list.add(
        ShopEleFav(i.shopId,i.name,i.imageUrl,i.city),
      );//add any Widget in place of Text("Index $i")
    }
    return list;// all widget added now retrun the list here
  }
}