import 'package:chalee/screens/ChooseLcoation.dart';
import 'package:chalee/services/api.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'EditPassword.dart';
String firstname;
String lastname;
String email;
class Profile extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  //todo add edit
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
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: null),
        actions: [
          IconButton(icon: Icon(FlutterIcons.pencil_alt_faw5s), onPressed: null)
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
                  IconButton(
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: ColorApp.primary,
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseLocation()),
                      );
                    },
                  ),
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
                    child: Text(
                      firstname,
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
                    'Last Name',
                    style: TextStyle(fontFamily: "main"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      lastname,
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
                    'Email',
                    style: TextStyle(fontFamily: "main"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      email,
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
              Expanded (
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
              ),
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
