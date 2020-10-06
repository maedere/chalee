import 'dart:math';
import 'dart:ui';

import 'package:chalee/screens/KoponActivity.dart';
import 'package:chalee/screens/ListCatagories.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

const kMinScrollBarHeight = 40.0;

class SelectionActivity extends StatefulWidget {
  @override
  _SelectionActivityState createState() => _SelectionActivityState();
}

class _SelectionActivityState extends State<SelectionActivity> {
  double _scrollBarOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onVerticalDragUpdate: (tapDetails) => setState(
                  () => _scrollBarOffset = tapDetails.globalPosition.dy),
              child: Stack(
                children: <Widget>[
                  Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: ColorApp.primary,),
                            //todo set radius
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                               /* SizedBox(
                                  height: 140,
                                ),*/
                                Align(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=> KoponActivity(),),);
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                            width: 50,
                                            height: 50,
                                            margin: EdgeInsets.symmetric(horizontal: 15),
                                            decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(.7),
                                                shape: BoxShape.circle
                                            ),
                                            child:  Column(
                                              children: [
                                                Lottie.asset('assets/animation/lottile/kopen.json' , width: 50 , height: 50 , fit: BoxFit.fill),
                                              ],
                                            )
                                        ),
                                        Text("coupon" , style: TextStyle(color: Colors.white , fontFamily:"main"),)
                                      ],
                                    ),
                                  ),
                                ),
                                //todo image
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ListCatagories()),
                                    );
                                  },
                                  child: Expanded(
                                    child: Image(
                                      image: AssetImage(
                                        "assets/images/chaleeeall.png",
                                      ),
                                      width: 230,
                                      height: 120,
                                    ),
                                  ),
                                ),
                                Text(
                                  "CHALEE ALL",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20,
                                  fontFamily: "main"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                        /*        Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: Divider(
                                      color: Colors.white,
                                      thickness: 3,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Image(
                                    image: AssetImage(
                                      "assets/images/box_white.png",
                                    ),
                                    width: 120,
                                    height: 120,
                                  ),
                                ),
                                Text(
                                  "CHALEE BOX",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20,
                                      fontFamily: "main"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 30),
                                    child: Divider(
                                      color: Colors.white,
                                      thickness: 3,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Image(
                                    image: AssetImage(
                                      "assets/images/pass.png",
                                    ),
                                    width: 80,
                                    height: 80,
                                  ),
                                ),
                                Text(
                                  "CHALEE PASSENGER",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20,
                                      fontFamily: "main"),
                                ),
                                SizedBox(
                                  height: 10,
                                )*/
                              ],
                            ),
                          ),
              /*    Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: MediaQuery.of(context).size.height -
                            max(
                                _scrollBarOffset,
                                MediaQuery.of(context).padding.top +
                                    kToolbarHeight +
                                    kMinScrollBarHeight),
                        child: CustomPaint(
                          painter: MyDraggable(),
                          child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(32),
                                      bottomRight: Radius.circular(32))),
                              //todo set radius
                              child: Column(
                                children: [
                                  Expanded(child: Center(
                                    child : Lottie.asset('assets/animation/lottile/soon.json' , fit: BoxFit.fitWidth),
                                  )),
                                  Image(
                                    image: AssetImage(
                                      "assets/images/video.png",
                                    ),
                                    width: 80,
                                    height: 80,
                                  ),
                                  Image(
                                    image: AssetImage(
                                      "assets/images/arrow_down.png",
                                    ),
                                    width: 20,
                                    height: 20,
                                  ),
                                ],
                              )),
                        ),
                      )
                    ],
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
      /*  body: Column(
        children: [
          Expanded(flex : 1,child: Container(
            decoration: BoxDecoration(
            ),
          ))
        ],
      )*/
    );
  }
}

class MyDraggable extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.white;
    final Radius cornerRadius = Radius.circular(20.0);
    final double lineMargin = 30.0;

    // Draw slider
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(0.0, 0.0, size.width, size.height,
            bottomLeft: cornerRadius, bottomRight: cornerRadius),
        paint);
    paint.color = Colors.black.withAlpha(64);
    paint.strokeWidth = 1.5;

    // Draw triangle
    canvas.drawPoints(
        PointMode.polygon,
        [
          Offset((size.width / 2) - 5.0, size.height - 10.0),
          Offset((size.width / 2) + 5.0, size.height - 10.0),
          Offset((size.width / 2), size.height - 5.0),
          Offset((size.width / 2) - 5.0, size.height - 10.0),
        ],
        paint);

    // Draw line
    canvas.drawLine(
        Offset(lineMargin, size.height - kMinScrollBarHeight),
        Offset(size.width - lineMargin, size.height - kMinScrollBarHeight),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
