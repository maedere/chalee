import 'package:chalee/elements/CartItem.dart';
import 'package:chalee/model/local/MainCatagory.dart';
import 'package:chalee/screens/SearchActivity.dart';
import 'package:chalee/util/Constant.dart';
import 'package:chalee/util/faker.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;

  bool enable = false;
  bool enable2 = false;

  int _currentIndex = 0;
  Widget Choosed;

  List<Item> items;

  @override
  Widget build(BuildContext context) {

    if(!enable){

      if(enable2){
        items= [
          Item(
              id: 0,
              image: "assets/images/speed.png",
              title: "MARATHON",
              cheked: false),
          Item(
              id: 1,
              image: "assets/images/wheelchair.png",
              title: "WHEELER",
              cheked: false),
          Item(
              id: 2,
              image: "assets/images/bicycle.png",
              title: "BICYCLE",
              cheked: false),
        ];
      }else{
        items= [
          Item(
              id: 0,
              image: "assets/images/speed.png",
              title: "MARATHON",
              cheked: false),
          Item(
              id: 1,
              image: "assets/images/wheelchair.png",
              title: "WHEELER",
              cheked: false),
          Item(
              id: 2,
              image: "assets/images/bicycle.png",
              title: "BICYCLE",
              cheked: false),
          Item(
              id: 3,
              image: "assets/images/scooter.png",
              title: "SCOOTER",
              cheked: false),
          Item(
              id: 4,
              image: "assets/images/motorcycle.png",
              title: "MOTORBIKE",
              cheked: false),
          Item(
              id: 5, image: "assets/images/totok.png", title: "TOTOK", cheked: false),
          Item(id: 6, image: "assets/images/car.png", title: "CAR", cheked: false),
          Item(id: 7, image: "assets/images/all.png", title: "ALL", cheked: false),
        ];
      }

    }else{
      items= [
        Item(
            id: 0,
            image: "assets/images/speed.png",
            title: "MARATHON",
            cheked: false),
        Item(
            id: 1,
            image: "assets/images/wheelchair.png",
            title: "WHEELER",
            cheked: false),
        Item(
            id: 2,
            image: "assets/images/bicycle.png",
            title: "BICYCLE",
            cheked: false),
        Item(
            id: 3,
            image: "assets/images/scooter.png",
            title: "SCOOTER",
            cheked: false),
        Item(id: 7, image: "assets/images/all.png", title: "ALL", cheked: false),
      ];
    }

    switch (_currentIndex) {
      case 0:
        Choosed = _oneWidget();
        break;
      case 1:
        one = true;
        Choosed = _TwoWidget();
        break;
      case 2:
        two = true;
        Choosed = _ThreeWidget();
        break;
      case 3:
        three = true;
        Choosed = _FourWidget();
        break;
      case 4:
        four = true;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: null),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "My Order ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            width: ScreenUtil.screenWidth,
            color: Colors.white,
            height: 150.h,
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                  child: Row(
                    children: [
                      Container(
                        width: 85.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: one ? ColorApp.primary : Colors.grey[300],
                        ),
                        child: Center(
                          child: one
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : Text("1"),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        color: one ? ColorApp.primary : Colors.grey[300],
                        thickness: 2,
                      )),
                      Container(
                        width: 85.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: two ? ColorApp.primary : Colors.grey[300],
                        ),
                        child: Center(
                          child: two
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : Text("2"),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        color: two ? ColorApp.primary : Colors.grey[300],
                        thickness: 2,
                      )),
                      Container(
                        width: 85.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: three ? ColorApp.primary : Colors.grey[300],
                        ),
                        child: Center(
                          child: three
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : Text("3"),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        color: three ? ColorApp.primary : Colors.grey[300],
                        thickness: 2,
                      )),
                      Container(
                        width: 85.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: four ? ColorApp.primary : Colors.grey[300],
                        ),
                        child: Center(
                          child: four
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : Text("4"),
                        ),
                      ),
                      Divider(
                        color: four ? ColorApp.primary : Colors.grey[300],
                        thickness: 2,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Preview",
                      textAlign: TextAlign.center,
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      "shipping",
                      textAlign: TextAlign.center,
                    ),
                    Expanded(child: SizedBox()),
                    Text("payment"),
                    Expanded(child: SizedBox()),
                    Text("complete"),
                    Divider(),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Choosed,
          ),
          GestureDetector(
            onTap: () {
              if (four) {
                Constant.track = true;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchActivity(
                      mainCatagory: MainCatagory(id: 1, title: null, url: null),
                    ),
                  ),
                );
              } else {
                setState(() {
                  _currentIndex++;
                  print("clicked");
                });
              }
            },
            child: Container(
              width: ScreenUtil.screenWidth,
              height: 120.h,
              color: ColorApp.primary,
              child: Center(
                child: Text(
                  "NEXT",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "main",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _oneWidget() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: Constant.orders.map((e) => CartItem(model: e)).toList(),
          ),
        ),
        Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 16.h),
          padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 30.w),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Sub total :",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "main",
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "\$250",
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: "main",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    "shipping fee :",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "main",
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "-",
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: "main",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    "Discount",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "main",
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "\$5",
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: "main",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    "Grand Total",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "main",
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "\$255",
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: "main",
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _ThreeWidget() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 30.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        5,
                      ),
                      bottomLeft: Radius.circular(
                        5,
                      ),
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                  child: Row(
                    children: [
                      Text(
                        "Cash Payment",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "main",
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Image(
                        image: AssetImage("assets/images/delivery.png"),
                        width: 24,
                        height: 24,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorApp.primary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        5,
                      ),
                      bottomRight: Radius.circular(
                        5,
                      ),
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                  child: Row(
                    children: [
                      Text(
                        "PayPal",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "main",
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Image(
                        image: AssetImage("assets/images/card.png"),
                        width: 24,
                        height: 24,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200.h,
          ),
          Row(
            children: [
              Text(
                "Sub total :",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "main",
                ),
              ),
              Expanded(child: SizedBox()),
              Text(
                "\$250",
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: "main",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text(
                "shipping fee :",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "main",
                ),
              ),
              Expanded(child: SizedBox()),
              Text(
                "-",
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: "main",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text(
                "Discount",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "main",
                ),
              ),
              Expanded(child: SizedBox()),
              Text(
                "\$5",
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: "main",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text(
                "Grand Total",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "main",
                    fontWeight: FontWeight.bold),
              ),
              Expanded(child: SizedBox()),
              Text(
                "\$255",
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: "main",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _TwoWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Text(
            "Your Name *",
            style: TextStyle(
              color: ColorApp.primary,
              fontFamily: "main",
            ),
          ),
          TextField(
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: "Alex"),
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            "Phone number *",
            style: TextStyle(
              color: ColorApp.primary,
              fontFamily: "main",
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: "0971"),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                flex: 4,
                child: TextField(
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: "1234567"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            "Email",
            style: TextStyle(
              color: ColorApp.primary,
              fontFamily: "main",
            ),
          ),
          TextField(
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: "name@mail.com"),
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            "Company",
            style: TextStyle(
              color: ColorApp.primary,
              fontFamily: "main",
            ),
          ),
          TextField(
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: "company name"),
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            "Additional note",
            style: TextStyle(
              color: ColorApp.primary,
              fontFamily: "main",
            ),
          ),
          TextField(
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: "insert your's description"),
          ),
          SizedBox(
            height: 50.h,
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: SizedBox(
              child:Row(
                children: [
                  Text("Do you want to help?" ,style: TextStyle(fontFamily: "main" , fontSize: 12),),
                  Expanded(child: SizedBox()),
                  SizedBox(
                    width: 80,
                    height: 40,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          enable2 = !enable2;
                        });
                      },
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Container(
                              width:100,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: enable2 ? ColorApp.primary : Colors.grey[300],
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            alignment: enable2 ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
                            child: Container(
                              //   margin: EdgeInsets.symmetric(vertical: 5.h , horizontal: 10.w),
                              padding: EdgeInsets.all(8),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: enable2 ? AssetImage("assets/images/help.png",) : AssetImage("assets/images/help1.png",)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
          SizedBox(height: 10,),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: SizedBox(
              child:Row(
                children: [
                  Text("Do you want your country to be green?" ,style: TextStyle(fontFamily: "main" , fontSize: 12),),
                  Expanded(child: SizedBox()),
                  SizedBox(
                    width: 80,
                    height: 40,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          enable = !enable;
                        });
                      },
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Container(
                              width:100,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: enable ? ColorApp.primary : Colors.grey[300],
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            alignment: enable ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
                            child: Container(
                              //   margin: EdgeInsets.symmetric(vertical: 5.h , horizontal: 10.w),
                              padding: EdgeInsets.all(8),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: enable ? AssetImage("assets/images/plant.png",) : AssetImage("assets/images/back.png",)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text("Deliver by" , style: TextStyle(fontFamily: "main" , fontSize: 16),),
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: 120,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, i) {
                return CartChoose(items[i]);
              },
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 10.h),
                itemExtent: 140,
            ),
          )
        ],
      ),
    );
  }

  Widget _FourWidget() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: AssetImage("assets/images/confrim.png"),
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.width / 3,
          ),
          SizedBox(
            height: 50.h,
          ),
          Text("Order Successfully")
        ],
      ),
    );
  }

  Widget CartChoose(Item item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          item.cheked = !item.cheked;
        });
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          child: Container(
            width: 250,
            height: 250,
            child: Stack(
              children: [
                if (item.cheked)
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Image(
                      image: AssetImage("assets/images/check.png"),
                      width: 40.h,
                      height: 40.h,
                    ),
                  ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Image(
                        image: AssetImage(
                          item.image,
                        ),
                        width: 100.w,
                        height: 100.w,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        item.title,
                        style: TextStyle(fontSize: 12, fontFamily: "main"),
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          SizedBox(width: 30.w,),
                          Icon(Icons.timer),
                          Text("2 minute" , style:TextStyle(fontSize: 12, fontFamily: "main") ),
                        ],
                      ),
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

class Item {
  final int id;
  final String image;
  final String title;
  bool cheked;

  Item(
      {@required this.id,
      @required this.image,
      @required this.title,
      @required this.cheked});
}
