import 'package:chalee/model/json/User.dart';
import 'package:chalee/screens/SignInActivity.dart';
import 'package:chalee/services/api.dart';
import 'package:chalee/util/Constant.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpActivity extends StatefulWidget {
  @override
  _SignUpActivityState createState() => _SignUpActivityState();
}

class _SignUpActivityState extends State<SignUpActivity> {

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  final TextEditingController Cphone1 = TextEditingController();
  final TextEditingController Cphone2 = TextEditingController();
  final TextEditingController Cpass1 = TextEditingController();
  final TextEditingController Cpass2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _globalKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          children: [
            Expanded(child: SizedBox()),
            Expanded(
              child: Text(
                "Sign up with mobile \n number",
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
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "YOUR PHONE",
                    style: TextStyle(
                      color: ColorApp.primary,
                      fontFamily: "main",
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: Cphone1,
                          decoration: InputDecoration(
                            hintText: "0971",
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      Expanded(
                        flex: 4,
                        child: TextField(
                          controller: Cphone2,
                          decoration: InputDecoration(
                            hintText: "91999999",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "PASSWORD",
                    style: TextStyle(
                      color: ColorApp.primary,
                      fontFamily: "main",
                    ),
                  ),
                  TextField(
                    controller: Cpass1,
                    decoration: InputDecoration(
                      hintText: "******",
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "CONFIRM PASSWORD",
                    style: TextStyle(
                      color: ColorApp.primary,
                      fontFamily: "main",
                    ),
                  ),
                  TextField(
                    controller: Cpass2,
                    decoration: InputDecoration(
                      hintText: "******",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            GestureDetector(
              onTap: (){
                if(
                Cpass1.text.isNotEmpty &&
                Cpass2.text.isNotEmpty &&
                Cphone1.text.isNotEmpty &&
                Cphone2.text.isNotEmpty
                ) {
                  if (Cpass2.text == Cpass1.text) {
                    registry(UserRegister(username: Cphone1.text + Cphone2.text,
                        password: Cpass1.text), _globalKey);
                  } else {
                     _globalKey.currentState.showSnackBar(Constant.snak("repeat password not true!",),);
                  }
                }else{
                  _globalKey.currentState.showSnackBar(Constant.snak("please fill all field",),);
                }
              },
              child: Container(
                height: 150.h,
                decoration: BoxDecoration(
                  color: ColorApp.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, fontFamily: "main"),
                  ),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SignInActivity(),),);
              },
              child: RichText(
                text: TextSpan(
                  text: "Have an account ?",
                  style: TextStyle(color: Colors.black , fontFamily: "main"),
                  children: <TextSpan>[
                    TextSpan(text: "Sign in" , style: TextStyle(color: ColorApp.primary , fontFamily: "main",),),
                  ],
                ),
              ),
            ),
            //RichText("Have an account ? sign in"),
            SizedBox(
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}
