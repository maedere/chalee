
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordActivity extends StatefulWidget{
  @override
  _ForgetPasswordActivityState createState() => _ForgetPasswordActivityState();
}

class _ForgetPasswordActivityState extends State<ForgetPasswordActivity> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _userController1 = TextEditingController();

  @override
  void dispose() {
    _userController1.dispose();
    super.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.w),
        child: Column(
          children: [
            Expanded(child: SizedBox()),
            Expanded(
              child: Text(
                "Recovery Your Password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "main",
                  fontSize: 26,
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    "YOUR PHONE",
                    style: TextStyle(
                      color: ColorApp.primary,
                      fontFamily: "main",
                    ),
                  ),
                   TextField(
                    controller: _userController1,
                    decoration: InputDecoration(
                      hintText: "91999999",
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Container(
              height: 150.h,
              decoration: BoxDecoration(
                color: ColorApp.primary,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "Get Code",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "main"),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}