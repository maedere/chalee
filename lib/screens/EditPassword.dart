import 'package:chalee/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ChooseLcoation.dart';

String password;
String username;
String firstname;
String lastName;
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
  void showInSnackBar(String value) {
    _key.currentState.showSnackBar(new SnackBar(content: new Text(value)));
  }


  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      var sahredprfrenc=prefs;
      password =(sahredprfrenc.getString("password"));
      firstname =(sahredprfrenc.getString("firstname"));
      lastName =(sahredprfrenc.getString("lastName"));
      email =(sahredprfrenc.getString("email"));
      username =(sahredprfrenc.getString("username"));
    });
    return Scaffold(
      key : _key,
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
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(
              context,
            );
          },
          color: Colors.grey,),
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
                        print(username+"username");
                        print(password+"password");
                        print(firstname);
                        print(lastName);
                        print(email);

                        print(password);
                        if(oldpass.text!=password)
                        {
                          showInSnackBar("Your Old Password Is Wrong!");
                        }
                        else if(newpass.text!=repeatpass.text)
                        {

                          showInSnackBar("Your Repatitve Password is not same New password");
                        }
                        else
                        {


                          var future = editPass(username,password,newpass.text,firstname,lastName,email, _key);
                          password=newpass.text;
                          Navigator.pop(context);
                          showInSnackBar("Your Password Changed Successful");

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