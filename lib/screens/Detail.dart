import 'package:chalee/elements/rate/smiley_rating_dialog.dart';
import 'package:chalee/model/json/ShopComment.dart';
import 'package:chalee/services/api.dart';
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
  final String id;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  List<Shop_Good_Comment> goodComments=[];
  Detail({@required this.image, @required this.heroTag, this.description, this.finalPrice, this.calory,this.spicy,this.id});

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
                              getGoodComment(widget.id, "0", widget._key).then((value){
                                setState(() {
                                  widget.goodComments=value;
                                  if(_alignmentDirectional == AlignmentDirectional.topCenter)
                                    _alignmentDirectional = AlignmentDirectional.bottomCenter;
                                  else
                                    _alignmentDirectional = AlignmentDirectional.topCenter;
                                });
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
                                      //height: 50,
                                      child: Column(
                                        children: comments(),
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
                                      shop_good_Id: widget.id,
                                      title: Text(
                                        'Comment',
                                        textAlign: TextAlign.center,
                                      ),
                                      starColor: Colors.yellowAccent,
                                      isRoundedButtons: true,
                                      type: "good",
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
  List<Widget> comments() {
    List<Widget> list = List();
    //i<5, pass your dynamic limit as per your requirment
    for (final i in widget.goodComments) {

      list.add(
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: i.rate==null?DecorationImage(image: AssetImage("assets/images/cry.png",),):
                  i.rate=="1"? DecorationImage(image: AssetImage("assets/images/angry.png",),):
                  i.rate=="2"?DecorationImage(image: AssetImage("assets/images/cry.png",),):
                  i.rate=="3"?DecorationImage(image: AssetImage("assets/images/sad.png",),):
                  i.rate=="4"?DecorationImage(image: AssetImage("assets/images/smile.png",),):
                  DecorationImage(image: AssetImage("assets/images/love.png",),),
                ),
              ),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "  ${i.time} - ${i.commenterName}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "main",
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    i.comment,
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
      );//add any Widget in place of Text("Index $i")
    }
    return list;// all widget added now retrun the list here
  }
}
