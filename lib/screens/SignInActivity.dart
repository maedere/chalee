import 'package:chalee/model/json/User.dart';
import 'package:chalee/screens/ForggetPasswordActivity.dart';
import 'package:chalee/screens/SelectionActivity.dart';
import 'package:chalee/screens/SignUpActivity.dart';
import 'package:chalee/screens/VerificationActivity.dart';
import 'package:chalee/services/api.dart';
import 'package:chalee/util/Constant.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInActivity extends StatefulWidget {
  @override
  _SignInActivityState createState() => _SignInActivityState();
}

class _SignInActivityState extends State<SignInActivity> {
  bool isLoading=false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _userController1 = TextEditingController();
  final _userController2 = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose() {
    _userController1.dispose();
    _userController2.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          children: [
            Expanded(child: SizedBox()),
            Expanded(
              child: Text(
                "Sign in with mobile \n number",
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
                          controller: _userController1,
                          decoration: InputDecoration(
                            hintText: "0971",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Expanded(
                        flex: 4,
                        child: TextField(
                          controller: _userController2,
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
                    controller: _passController,
                    decoration: InputDecoration(
                      hintText: "******",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            GestureDetector(
                  onTap :  () async
                  {
                setState(() {
                  if(isLoading==false)
                    isLoading=true;

                });
                print(await  login(UserRegister(username : _userController1.text + _userController2.text,
                  password: _passController.text,), _scaffoldKey)+"here");
              },
              child : signInButton(context),

            ),
            Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpActivity(),
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account ?",
                  style: TextStyle(color: Colors.black, fontFamily: "main"),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        color: ColorApp.primary,
                        fontFamily: "main",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => ForgetPasswordActivity(),),);
              },
              child: RichText(
                text: TextSpan(
                  text: "i forgot password.",
                  style: TextStyle(color: Colors.black, fontFamily: "main"),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Please help me",
                      style: TextStyle(
                        color: ColorApp.primary,
                        fontFamily: "main",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
  Container signInButton(context) {
    if (isLoading == false) {

      return Container(
        height: 150.h,
        decoration: BoxDecoration(
          color: ColorApp.primary,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            "SIGN IN",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "main"),
          ),
        ),
      );
    }else{


      return Container(
        height: 150.h,
        decoration: BoxDecoration(
          color: ColorApp.primary,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
