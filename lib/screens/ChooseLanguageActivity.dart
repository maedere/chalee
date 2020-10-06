import 'package:chalee/screens/ChooseLcoation.dart';
import 'package:chalee/screens/SignInActivity.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseLanguageActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorApp.primary,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 80.h),
                child: Image(
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Select Country ", style: TextStyle(color: Colors.white , fontSize:16 , fontFamily: "main"),),
                    SizedBox(height: 100.h,),
                    ListTile(
                      onTap: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInActivity(),),);
                      },
                      title: Text(
                        "Angola",
                        style: TextStyle(
                          fontFamily: "main",
                          color: Colors.white,
                        ),
                      ),
                      leading: Image(
                        image: AssetImage("assets/images/angol.png"),
                        width: 120.w,
                        height: 120.w,
                      ),
                    ),
                    ListTile(
                      onTap: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignInActivity(),),);
                      },
                      title: Text(
                        "United Arab Emirates",
                        style: TextStyle(
                          fontFamily: "main",
                          color: Colors.white,
                        ),
                      ),
                      leading: Image(
                        image: AssetImage("assets/images/arab.png"),
                        width: 120.w,
                        height: 120.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
