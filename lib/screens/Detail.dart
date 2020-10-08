import 'package:chalee/elements/rate/smiley_rating_dialog.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Detail extends StatefulWidget {

  final String image;
  final String heroTag;
  final String description;
  final String finalPrice;
  final String calory;
  final String spicy;

  Detail({@required this.image, @required this.heroTag, this.description, this.finalPrice, this.calory,this.spicy});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  AlignmentDirectional _alignmentDirectional =
      AlignmentDirectional.bottomCenter;


  bool show = false;



  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center( child: Hero(
              tag: widget.heroTag,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal:15.w),
                /*decoration: BoxDecoration(
                  image: DecorationImage(

                    image: AssetImage(
                      widget.image,
                    ),
                  ),
                ),*/
                child: Image.network(widget.image),
              ),
            ),),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                  topLeft: Radius.circular(60),
                ),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: Offset(0, -3),
                      color: ColorApp.primary.withOpacity(.7),
                      blurRadius: 7)
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 70.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.heroTag,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'main',
                          fontSize: 22,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Text(
                        '\$'+widget.finalPrice,
                        style: TextStyle(
                          fontFamily: 'main',
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                     widget.description,
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'main',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image(image: AssetImage("assets/images/xx1.png",),width: 40,height: 40,),
                      SizedBox(width: 20.w,),
                      Text("${widget.calory} kcal" , style: TextStyle(color: ColorApp.primary,fontSize: 17 , fontFamily: "main"),),
                      Expanded(child: SizedBox(),),

                      if(widget.spicy=="0")
                        Image(image: AssetImage("assets/images/hell.png",),height: 40,),
                      if(widget.spicy=="1")
                        Image(image: AssetImage("assets/images/hell.png",),height: 40,),
                     if(widget.spicy=="2")
                        Image(image: AssetImage("assets/images/hell.png",),height: 40,),
                     if(widget.spicy=="3")
                        Image(image: AssetImage("assets/images/hell.png",),height: 40,),
                     if(widget.spicy=="4")
                        Image(image: AssetImage("assets/images/hell.png",),height: 40,),
                     if(widget.spicy=="5")
                        Image(image: AssetImage("assets/images/hell.png",),height: 40,),
                    ],
                  ),
                  SizedBox(height: 30.h,),
                  Align(alignment : AlignmentDirectional.topStart,child: Image(image: AssetImage("assets/images/vege.png",),width: 40,height: 40,)),
                  Flexible(
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if(_alignmentDirectional == AlignmentDirectional.topCenter)
                              _alignmentDirectional = AlignmentDirectional.bottomCenter;
                              else
                                _alignmentDirectional = AlignmentDirectional.topCenter;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 600),
                            alignment: _alignmentDirectional,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 15.h, horizontal: 15.w),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.h, horizontal: 100.w),
                                    decoration: BoxDecoration(
                                      color: ColorApp.primary,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: ColorApp.primary.withOpacity(.7),
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Comment',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'main',
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: 20.w,),
                                        Icon(Icons.keyboard_arrow_down,
                                            color: Colors.white)
                                      ],
                                    ),
                                  ),

                                  //todo here
                                  if(show)
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(image: AssetImage("assets/images/cry.png",),),
                                            ),
                                          ),
                                          Expanded(child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "  saturday , june 12th 2020 , 03:46 - naser",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: "main",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "i hated",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "main",
                                                ),
                                              ),
                                            ],
                                          ),)
                                        ],
                                      ),
                                    ),
                                  if(show)
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(image: AssetImage("assets/images/smile.png",),),
                                            ),
                                          ),
                                          Expanded(child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "  Monday , june 8th 2020 , 03:46 - s",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: "main",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "  hi , very good",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "main",
                                                ),
                                              ),
                                            ],
                                          ),)
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            onEnd: (){
                                setState(() {
                                  show = !show;
                                });
                            },
                          ),
                        ),

                        if(show)
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            onPressed: () {
                              showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (context) {
                                    return SmileyRatingDialog(
                                      title: Text(
                                        'Comment',
                                        textAlign: TextAlign.center,
                                      ),
                                      starColor: Colors.yellowAccent,
                                      isRoundedButtons: true,
                                      positiveButtonText: 'Ok',
                                      negativeButtonText: 'Cancel',
                                      positiveButtonColor: ColorApp.primary,
                                      negativeButtonColor: ColorApp.primary,
                                      onCancelPressed: () => Navigator.pop(context),
                                      onSubmitPressed: (rating) {Navigator.pop(context);},
                                    );
                                  });
                            },
                            child: Text(
                              "Write Review",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "main",
                              ),
                            ),
                            color: ColorApp.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
