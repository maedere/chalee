import 'package:chalee/elements/TabDetail/About.dart';
import 'package:chalee/elements/TabDetail/Reviews.dart';
import 'package:chalee/elements/TabDetail/menu.dart';
import 'package:chalee/model/json/ShopModel.dart';
import 'package:chalee/services/api.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
List <String> shopLiked=[];
bool like=false;


class ShopDetailActivity extends StatefulWidget {
  final Shop shop;
  int currentindex=0;
  ShopDetailActivity({@required this.shop});

  @override
  _ShopDetailActivityState createState() => _ShopDetailActivityState();
}

class _ShopDetailActivityState extends State<ShopDetailActivity> {
  @override
  void initState()
  {
    getFavotiteshop(username,password,_key).then((value){

      setState(() {
        for(final i in value)
          shopLiked.add(i.shopId);

        for(final i in shopLiked)
          {
            print(i+"000000000000000000000000000000000");
            print(widget.shop.shopId+"888888");
            if(widget.shop.shopId==i) {
              widget.shop.like=true;
              print("kjkjllllllllllllllllll");

            }

          }

      });
    });
  }
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
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          icon:widget.shop.like==true ? Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: MediaQuery.of(context).size.width/15,

                                          ):Icon(
                                            Icons.favorite_border,
                                            color: Colors.red,
                                            size: MediaQuery.of(context).size.width/15,
                                          ),
                                          onPressed: (){
                                            widget.shop.like==false?addFavoriteshop(username,password,widget.shop.shopId, _key).then((value) {
                                              setState(() {
                                                widget.shop.like=!widget.shop.like;
                                              });
                                            }):

                                            /*deleteFavoriteshop(username,password,widget.shop.shopId, _key).then((value) {*/
                                              setState(() {
                                                widget.shop.like=!widget.shop.like;
                                              });
                                            /*});*/

                                          },
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
                                        initialIndex: 0,
                                        child: Container(
                                          child: TabBar(
                                            onTap: (index){
                                              setState(() {
                                                widget.currentindex=index;
                                              });


                                            },
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

                                        ),
                                    ),
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
                  child: tabbaritems(widget.currentindex),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget tabbaritems(int index){
    if(index==0)
      return TabBarView(
        children: [
          Menu(shopId: widget.shop.shopId,),
          Reviews( widget.shop.shopId,),
          About(shop: widget.shop,),
        ],
      );
    if(index==1)
      return TabBarView(
        children: [
          Reviews( widget.shop.shopId,),
          Menu(shopId: widget.shop.shopId,),
          About(shop: widget.shop,),
        ],
      );
    if(index==2)
      return TabBarView(
        children: [
          About(shop: widget.shop,),
          Menu(shopId: widget.shop.shopId,),
          Reviews( widget.shop.shopId,),
        ],
      );
  }
}
