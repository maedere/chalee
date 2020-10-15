import 'package:chalee/model/json/EditPass.dart';
import 'package:chalee/screens/Profile.dart';
import 'package:chalee/util/Constant.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:chalee/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ChooseLcoation.dart';

String password;
String username;
String firstname;
String lastName;
String newpass1;
String email;
TextEditingController oldpass = new TextEditingController();
TextEditingController repeatpass = new TextEditingController();
TextEditingController newpass = new TextEditingController();
class EditPassword extends StatefulWidget {
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

/*  void initState() {
     var future = editPass(username,password,newpass1,firstname,lastName,email, _key).then((value){
      setState(() {


      });
    });    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      var sahredprfrenc=prefs;
      password =(sahredprfrenc.getString("password"));
      firstname =(sahredprfrenc.getString("firstname"));
      lastName =(sahredprfrenc.getString("lastName"));
      email =(sahredprfrenc.getString("email"));
      username =(sahredprfrenc.getString("username"));
      newpass1 =(sahredprfrenc.getString("newpass"));
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Edit Password',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "main",
          ),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:null),
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
                    width: MediaQuery.of(context).size.width/50,
                    height: MediaQuery.of(context).size.height/15,
                  ),
                  Expanded(

                    child:TextField(
                      controller: oldpass,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Your Old Password'

                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/50,
                    height: MediaQuery.of(context).size.height/15,
                  ),
                  Expanded(
                    child:TextField(
                      controller: newpass,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Your new Password'
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/50,
                    height: MediaQuery.of(context).size.height/15,
                  ),
                  Expanded(

                    child:TextField(
                      controller: repeatpass,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                          'Repeat Your New Password'
                      ),
                    ),
                  ),

                ],
              ),
              Divider(),
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
                        editPass(username,password,newpass.text,firstname,lastName,email, _key);
                        print(username+"username");
                        print(password+"password");
                        print(newpass.text+"newpass1");
                        newpass1=newpass.text;
                        print(firstname);
                        print(lastName);
                        print(email);

                        if(newpass.text!=repeatpass.text)
                        {
                          print("Your Repatitve Password is not same New password");
                        }
                        else
                        {
                          Navigator.pop(context);
                        }
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text
                          (
                          "Save",
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
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



