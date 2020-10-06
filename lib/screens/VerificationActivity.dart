import 'package:chalee/screens/SelectionActivity.dart';
import 'package:chalee/services/api.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationActivity extends StatefulWidget {

  final String mobile;

  VerificationActivity({@required this.mobile});

  @override
  _VerificationActivityState createState() => _VerificationActivityState();
}

class _VerificationActivityState extends State<VerificationActivity> {

  GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getCode(widget.mobile, _globalKey).then((result){

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Column(
          children: [
            SizedBox(height: 300.h,),
            Text("Verification Code" , style: TextStyle(fontFamily: "main" , fontSize: 26,),),
            Text("SMS verification code has been send to:" , style: TextStyle(fontFamily: "main" , fontSize: 22,),textAlign: TextAlign.center,),
            SizedBox(height: 50.h,),
            Text(widget.mobile , style: TextStyle(fontFamily: "main" , fontSize: 26,color: ColorApp.primary),),
            SizedBox(height: 200.h,),
            Text(
              "PIN CODE",
              style: TextStyle(
                color: ColorApp.primary,
                fontFamily: "main",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "******",
              ),
            ),
            Expanded(child: SizedBox()),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SelectionActivity(),),);
              },
              child: Container(
                height: 150.h,
                decoration: BoxDecoration(
                  color: ColorApp.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, fontFamily: "main"),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h,),
          ],
        ),
      ),
    );
  }
}
