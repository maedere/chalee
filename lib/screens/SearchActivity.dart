/*
import 'dart:async';
import 'dart:async';

import 'package:chalee/elements/DialogTest.dart';
import 'package:chalee/elements/ShopElement.dart';
import 'package:chalee/model/json/ShopModel.dart';
import 'package:chalee/model/json/User.dart';
import 'package:chalee/model/local/MainCatagory.dart';
import 'package:chalee/screens/FreeFood.dart';
import 'package:chalee/screens/Profile.dart';
import 'package:chalee/screens/ShowcaseDeliveryTimeline.dart';
import 'package:chalee/services/api.dart';
import 'package:chalee/util/Constant.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ChooseLcoation.dart';

List<Address> addresses=[];
String username="";
String password="";
class SearchActivity extends StatefulWidget {
  final MainCatagory mainCatagory;

  SearchActivity({@required this.mainCatagory});

  @override
  _SearchActivityState createState() => _SearchActivityState();
}

class _SearchActivityState extends State<SearchActivity> {
  List<Shop> shops = [];

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getShopType(ShopRequestType(
        type: "near",
        rangeId: 0,
        categoryId: widget.mainCatagory.id.toString(),
        addressId: "1",
        password: Constant.user.password,
        username: Constant.user.username,
        search: ""
    ) , _key).then((value){
      setState(() {
        print("here");
        if(shops != null) {
          shops = value;

        }
      });
    });
    SharedPreferences sahredprfrenc;
    SharedPreferences.getInstance().then((prefs) {
      sahredprfrenc=prefs;

      username=(sahredprfrenc.getString("username"));
      password=(sahredprfrenc.getString("password"));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          //todo
          IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
              onPressed: () {
                /*print(username);
                getAddresses(username,password,_key).then((value){
                  setState(() {
                    addresses=value;
                  });
                });
                showDialog(
                  context: context,
                  builder: (_) => AddressDialog(),
                );*/
                getAddresses(username,password,_key).then((value){
                  setState(() {
                    addresses=value;
                  });
                  showDialog(
                    context: context,
                    builder: (_) => AddressDialog(addresses),
                  );
                });

              })
        ],
        centerTitle: true,
        title: Text(
          "Chaleee",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.sort,
            color: Colors.black,
          ),
          onPressed: () {
            _showMyDialog(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.grey[300],
        child: Stack(
          children: [
            Column(
              children: [
                Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "New York"),
                        ),
                      ),
                      Lottie.asset("assets/animation/lottile/loc.json",
                          width: 60, height: 60, fit: BoxFit.fill),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Image(
                          image: AssetImage(
                            "assets/images/ads.gif",
                          ),
                        ),
                      ),
                      if (Constant.track)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ShowcaseDeliveryTimeline(),
                              ),
                            );
                          },
                          child: Container(
                            color: Color.fromRGBO(244, 249, 255, 1),
                            padding: EdgeInsets.symmetric(
                                vertical: 20.h, horizontal: 40.w),
                            margin: EdgeInsets.symmetric(
                                vertical: 20.h, horizontal: 20.w),
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage("assets/images/clock.gif"),
                                  width: 40,
                                  height: 40,
                                ),
                                Expanded(
                                  child: Text(
                                    "Track Your Order ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorApp.primary,
                                      fontFamily: "main",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                      if(shops.length > 0)
                        for(Shop s in shops)
                          ShopElement(shop: s),
                      */
/*      ShopElement(
                        shop: Shop(username: "0"),
                      ),
                      ShopElement(
                        shop: Shop(username: "1"),
                      ),
                      ShopElement(
                        shop: Shop(username: "2"),
                      ),
                      ShopElement(
                        shop: Shop(username: "3"),
                      ),*//*

                      SizedBox(height: 130.h,)
                    ],
                  ),
                  */
/*    child: shops.length > 0 ? ListView.builder(
                    scrollDirection: Axis.vertical,
                   itemBuilder: (context , i){
                      return ShopElement(id: ,)
                   },
                  ):CircularProgressIndicator(value: 10,)*//*

                )
              ],
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FreeFoodActivity()),
                    );
                  },
                  child: Container(
                    height: 130.h,
                    decoration: BoxDecoration(
                        color: ColorApp.primary,
                        borderRadius: BorderRadius.all(Radius.circular(300))),
                    child: Center(
                      child: Text(
                        "Free Food ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext scaffoldContext) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {

        return Dialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.grey[500],
          elevation: 4,
          child: Container(
            //padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width/2,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Text("Search Filter"),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Text(
                  "Please select option",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                SizedBox(
                  height:MediaQuery.of(context).size.height / 30 ,
                  child: RaisedButton(
                    onPressed: () => {
                      Navigator.pop(context),
                      getShopType(ShopRequestType(
                          type: "near",
                          rangeId: 0,
                          categoryId: widget.mainCatagory.id.toString(),
                          addressId: "1",
                          password: Constant.user.password,
                          username: Constant.user.username,
                          search: ""
                      ) , _key).then((value){
                        setState(() {
                          if(shops != null) {
                            shops = value;
                          }
                        });
                      })
                    },
                    color: Colors.white,
                    child: Text(

                      "   NEAR BY  ",

                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 90,
                ),
                SizedBox(
                  height:MediaQuery.of(context).size.height / 30 ,
                  child: RaisedButton(

                      onPressed: () => {
                        Navigator.pop(context),
                        getShopType(ShopRequestType(
                            type: "rate",
                            rangeId: 0,
                            categoryId: widget.mainCatagory.id.toString(),
                            addressId: "1",
                            password: Constant.user.password,
                            username: Constant.user.username,
                            search: ""
                        ) , _key).then((value){
                          setState(() {
                            if(shops != null) {
                              shops = value;
                            }
                          });
                        })
                      },
                      color: Colors.white,
                      child: Text(
                        "TOP RATED",
                      ),

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      )),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
//---------------------
/*
class AddressDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddressDialogState();
}

class AddressDialogState extends State<AddressDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(15.0),
              height: 320.0,

              decoration: ShapeDecoration(
                  color: Colors.blue[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 20.0, right: 20.0),
                          child: Text(
                            "choose your address",
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        )),

                    Column(
                      children: addresse(),
                    )
                    ,
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: IconButton( icon: Icon(
                        Icons.add_circle_outline,
                        color: Colors.black,
                      ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseLocation(false,"-1")),
                          );
                        },),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
  List<Widget> addresse() {
    List<Widget> list = List();
    List<int> locations=[1,2,4];
    //i<5, pass your dynamic limit as per your requirment
    for (final i in addresses) {
      list.add(
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              children: [
                IconButton( icon: Icon(
                  Icons.location_on_sharp,
                  color: Colors.black,
                )),
                SizedBox(width: 20,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "main",
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      i.address,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "main",
                      ),
                    ),
                  ],
                ),),
                IconButton( icon: Icon(
                  Icons.check_box_outline_blank_sharp,
                  color: Colors.black,
                ),
                  onPressed: (){

                  },),
                IconButton( icon: Icon(
                  Icons.edit_location_outlined,
                  color: Colors.black,
                ),
                  onPressed: (){

                  },),
                IconButton( icon: Icon(
                  Icons.delete_forever,
                  color: Colors.black,
                ),
                  onPressed: (){
                    deleteAddress(username,password,i.id,_key);
                  },),
              ],
            ),
          ),
        ),
      );//add any Widget in place of Text("Index $i")
    }
    return list;// all widget added now retrun the list here
  }
}*/
