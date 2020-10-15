
import 'package:chalee/elements/DialogTest.dart';
import 'package:chalee/screens/ChooseLcoation.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'EditPassword.dart';
String firstname;
String lastname;
String email;
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool edit=false;

  @override
  Widget build(BuildContext context) {
    SharedPreferences sahredprfrenc;
    SharedPreferences.getInstance().then((prefs) {
      sahredprfrenc=prefs;
      firstname =(sahredprfrenc.getString("firstname"));
      lastname =(sahredprfrenc.getString("lastName"));
      email =(sahredprfrenc.getString("email"));
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "main",
          ),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){},color: Colors.grey,),
        actions: [
          IconButton(icon: edit==false? Icon(FlutterIcons.pencil_alt_faw5s) :Icon(Icons.check),
            onPressed:(){
            setState(() {
              edit=!edit;

            });
            },
              color: Colors.grey)
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey[300],
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Address',
                    style: TextStyle(fontFamily: "main"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  edit==true?IconButton(
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: ColorApp.primary,
                    ),
                    onPressed: (){
                      // showDialog(
                      //   context: context,
                      //   builder: (_) => LogoutOverlay(),
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseLocation()),
                      );
                    },
                  ):SizedBox(),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      'My Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "main",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'First Name',
                    style: TextStyle(fontFamily: "main"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: edit==false? Text(
                      firstname,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "main",
                      ),
                    ): TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: firstname,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Last Name',
                    style: TextStyle(fontFamily: "main"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: edit==false?Text(
                      lastname,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "main",
                      ),
                    ):
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: lastname,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(fontFamily: "main"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child:edit==false? Text(
                      email,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "main",
                      ),
                    ):
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: email,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              edit==true?Expanded (
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(70, 25, 25, 25),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    width: MediaQuery.of(context).size.width-40,
                    height: MediaQuery.of(context).size.height/24,
                    child: InkWell(
                      onTap: ()
                      {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>EditPassword()
                        ));
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text
                          (
                          "Edit Password",
                          style: TextStyle
                            (
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontFamily: "main",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ):SizedBox(),
              SizedBox(
                height: MediaQuery.of(context).size.height/80,
              ),
            ],
          ),
        ),
      ),
    );
  }

}


//-------------------------------
class LogoutOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogoutOverlayState();
}

class LogoutOverlayState extends State<LogoutOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(15.0),
              height: 320.0,

              decoration: ShapeDecoration(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Column(
                children: <Widget>[
                  SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 20.0, right: 20.0),
                        child: Text(
                          "choose your address",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      )),

                  Expanded(
                      child: Column(
                        children: comments(),
                      )
                    /*Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ButtonTheme(
                                height: 35.0,
                                minWidth: 110.0,
                                child: RaisedButton(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  splashColor: Colors.white.withAlpha(40),
                                  child: Text(
                                    'Logout',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0),
                                  ),
                                  onPressed: () {
                                    // setState(() {
                                    //   Route route = MaterialPageRoute(
                                    //       builder: (context) => LoginScreen());
                                    //   Navigator.pushReplacement(context, route);
                                    // });
                                  },
                                )),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 10.0, top: 10.0, bottom: 10.0),
                              child:  ButtonTheme(
                                  height: 35.0,
                                  minWidth: 110.0,
                                  child: RaisedButton(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0)),
                                    splashColor: Colors.white.withAlpha(40),
                                    child: Text(
                                      'Cancel',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                         Route route = MaterialPageRoute(
                                          builder: (context) => LoginScreen());
                                      Navigator.pushReplacement(context, route);
                                    });
                                    },
                                  ))
                          ),
                        ],
                      )*/),
                ],
              )),
        ),
      ),
    );
  }
  List<Widget> comments() {
    List<Widget> list = List();
    List<int> locations=[1,2,4];
    //i<5, pass your dynamic limit as per your requirment
    for (final i in locations) {
      list.add(
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Row(
            children: [
              IconButton( icon: Icon(
                Icons.location_on_sharp,
                color: Colors.black,
              )),
             SizedBox(width: 20,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "main",
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "lolllll",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "main",
                    ),
                  ),
                  IconButton( icon: Icon(
                    Icons.check_box_outline_blank_sharp,
                    color: Colors.black,
                  )),                ],
              ),)
            ],
          ),
        ),
      );//add any Widget in place of Text("Index $i")
    }
    return list;// all widget added now retrun the list here
  }
}