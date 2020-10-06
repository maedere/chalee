import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KoponActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 30.w),
        child: ListView(
          children: [
            Image(
              image: AssetImage(
                "assets/images/t1.png",
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Image(
              image: AssetImage(
                "assets/images/t1.png",
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Image(
              image: AssetImage(
                "assets/images/t2.png",
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Image(
              image: AssetImage(
                "assets/images/t1.png",
              ),
            ),
            SizedBox(
              height: 20.h,
            ),     Image(
              image: AssetImage(
                "assets/images/t1.png",
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Image(
              image: AssetImage(
                "assets/images/t2.png",
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Image(
              image: AssetImage(
                "assets/images/t1.png",
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Image(
              image: AssetImage(
                "assets/images/t2.png",
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Image(
              image: AssetImage(
                "assets/images/t1.png",
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
