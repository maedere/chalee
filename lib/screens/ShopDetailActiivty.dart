import 'package:chalee/elements/TabDetail/About.dart';
import 'package:chalee/elements/TabDetail/Reviews.dart';
import 'package:chalee/elements/TabDetail/menu.dart';
import 'package:chalee/model/json/ShopModel.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopDetailActivity extends StatefulWidget {

  final Shop shop;

  ShopDetailActivity({@required this.shop});

  @override
  _ShopDetailActivityState createState() => _ShopDetailActivityState();
}

class _ShopDetailActivityState extends State<ShopDetailActivity> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.grey[300],
            child: Column(
              children: [
                Hero(
                  tag: widget.shop.shopId,
                  child: Container(
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/cover.jpg"))
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              padding: EdgeInsets.only(top: 10 , left: 5 , right: 5),
                              color: Colors.white,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.shop.name,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              widget.shop.city,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: ColorApp.primary,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              30,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            widget.shop.activity == "true" ? "open" : "close",
                                            style: TextStyle(color: Colors.white ,fontSize: 12),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                  Material(
                                    child: DefaultTabController(
                                        length: 3,
                                        child: Container(
                                          child: TabBar(
                                            //todo is correct
                                            indicatorColor: ColorApp.primary,
                                            labelColor: Colors.black,
                                            tabs: [
                                              Tab(
                                                text: "Menu",
                                              ),
                                              Tab(
                                                text: "Reviews",
                                              ),
                                              Tab(
                                                text: "About",
                                              ),
                                            ],
                                          ),
                                        ),),
                                  )

                                ],
                              ),
                            ),
                          ),
                       
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                     Menu(shopId: widget.shop.shopId,),
                      Reviews(),
                      About(shop: widget.shop,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
