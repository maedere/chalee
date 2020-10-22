
import 'dart:async';
import 'dart:convert';

import 'package:chalee/screens/ChooseLanguageActivity.dart';
import 'package:chalee/util/Constant.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashActivity extends StatefulWidget {

  //timer
  @override
  _SplashActivityState createState() => _SplashActivityState();
}

class _SplashActivityState extends State<SplashActivity> {

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool first = prefs.getBool("address");
    if (first == null) {
      first = true;
    }
    if (first) {

      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => ChooseLanguageActivity(),),);
    } else {

      String locData = prefs.getString("addressData");
      if(locData == null){
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => ChooseLanguageActivity(),),);
      }else{
        //todo get profile user if logined

        Constant.locationModel = jsonDecode(locData);
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => ChooseLanguageActivity(),),);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
        body: FlareActor("assets/animation/flare/Trim.flr", alignment:Alignment.center, fit:BoxFit.contain, animation:"splash",),);
  }
}
