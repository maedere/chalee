import 'package:chalee/screens/ChooseLcoation.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
String firstname;
String lastname;
String email;
class Profile extends StatelessWidget {
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
                    'Email         ',
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
            ],
          ),
        ),
      ),
    );
  }
}
