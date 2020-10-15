import 'dart:async';
import 'dart:async';

import 'package:chalee/elements/DialogTest.dart';
import 'package:chalee/elements/ShopElement.dart';
import 'package:chalee/model/json/ShopModel.dart';
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
              onPressed: () => Profile())
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
                      ),*/
                      SizedBox(height: 130.h,)
                    ],
                  ),
                  /*    child: shops.length > 0 ? ListView.builder(
                    scrollDirection: Axis.vertical,
                   itemBuilder: (context , i){
                      return ShopElement(id: ,)
                   },
                  ):CircularProgressIndicator(value: 10,)*/
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
