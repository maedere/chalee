
import 'package:chalee/elements/DialogTest.dart';
import 'package:chalee/model/json/Location.dart';
import 'package:chalee/model/json/User.dart';
import 'package:chalee/screens/ChooseLcoation.dart';
import 'package:chalee/services/api.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'EditPassword.dart';
import 'Setting.dart';
String firstname="";
String lastname="";
String email="";
String username="";
String password="";
String address="";
String lat="";
String lng="";
int selectedAddress=0;
List<Address> addresses=[];
TextEditingController fn = new TextEditingController();
TextEditingController ln = new TextEditingController();
TextEditingController em = new TextEditingController();
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool edit=false;



  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    getAddresses(username,password,_key).then((value){
      setState(() {
        addresses=value;
      });
    });
    super.initState();
  }
  //todo add edit
  @override
  Widget build(BuildContext context) {
    print("profile");
    SharedPreferences sahredprfrenc;
    SharedPreferences.getInstance().then((prefs) {
      sahredprfrenc=prefs;

      firstname =(sahredprfrenc.getString("firstname"));
      lastname =(sahredprfrenc.getString("lastName"));
      email =(sahredprfrenc.getString("email"));
      username=(sahredprfrenc.getString("username"));
      password=(sahredprfrenc.getString("password"));

      address=(sahredprfrenc.getString("address"));
      lat=(sahredprfrenc.getString("lat"));
      lng=(sahredprfrenc.getString("lng"));

      print(address+"---"+lat+"---"+lng);

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
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(
              context,
            );


          },
          color: Colors.grey,),
        actions: [
          IconButton(icon: edit==false? Icon(FlutterIcons.pencil_alt_faw5s) :Icon(Icons.check),
            onPressed:(){
            if(edit==true)
            {
              if(fn.text!="")
              {
                firstname=fn.text;
              }
              if(ln.text!="")
              {
                lastname=ln.text;
                print(ln.text+"___");
              }
              if(em.text!="")
              {
                email=em.text;
              }


                editPass(username,password,password,firstname,lastname,email, _key).then((value){
                setState(() {
                  edit = !edit;
                });
              });
            }
            else {
                  setState(() {
                    edit = !edit;
                  });
                }
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
                height: MediaQuery.of(context).size.height/25,
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
                      getAddresses(username,password,_key).then((value){
                        setState(() {
                          addresses=value;
                        });
                        showDialog(
                          context: context,
                          builder: (_) => AddressDialog(addresses),
                        );
                      });


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
                height: MediaQuery.of(context).size.height/25,
              ),
              Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height/25,
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
                      controller: fn,
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
                height: MediaQuery.of(context).size.height/25,
              ),
              Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height/25,
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
                      controller: ln,
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
                height: MediaQuery.of(context).size.height/25,
              ),
              Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height/25,
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
                      controller: em,
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
                height: MediaQuery.of(context).size.height/25,
              ),
              Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height/25,
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
class AddressDialog extends StatefulWidget {
  List<Address> addressesDialog=[];

  AddressDialog(this.addressesDialog);

  @override
  State<StatefulWidget> createState() => AddressDialogState();
}

class AddressDialogState extends State<AddressDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  String addressDialog="";
  String latDialog="";
  String lngDialog="";

  AddressDialogState();

  @override
  void initState() {
    super.initState();
    SharedPreferences sahredprfrenc;
    SharedPreferences.getInstance().then((prefs) {

      sahredprfrenc=prefs;
      setState(() {
        addressDialog=(sahredprfrenc.getString("address"));
        latDialog=(sahredprfrenc.getString("lat"));
        lngDialog=(sahredprfrenc.getString("lng"));
      });

    });
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
                  color: Colors.blue[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 20.0, right: 20.0),
                          child: Text(
                            "choose your address",
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        )),

                     Column(
                          children: addresse(),
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
                        )*/,
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: IconButton( icon: Icon(
                        Icons.add_circle_outline,
                        color: Colors.black,
                      ),
                      onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseLocation(false,"-1")),
                        );
                      },),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
  List<Widget> addresse() {
    List<Widget> list = List();
    //i<5, pass your dynamic limit as per your requirment
    for (final i in widget.addressesDialog) {
      print(i.address+"+++"+i.lat+"+++"+i.lng);

      list.add(
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                      i.address,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "main",
                      ),
                    ),
                                    ],
                ),),
                 IconButton( icon: Icon(
                   (!(latDialog.contains(i.lat.substring(0, i.lat.length - 1)) && lngDialog.contains(i.lng.substring(0, i.lng.length - 1)) && i.address==addressDialog))? Icons.check_box_outline_blank_sharp
                   :Icons.check_box_outlined,
                      color: Colors.black,
                    ),
                onPressed: (){
                  SharedPreferences sahredprfrenc;
                  SharedPreferences.getInstance().then((prefs) {
                    sahredprfrenc=prefs;
                    sahredprfrenc.setString("address", i.address);
                    sahredprfrenc.setString("lat", i.lat);
                    sahredprfrenc.setString("lng", i.lng);

                    setState(() {
                      addressDialog=i.address;
                      latDialog=i.lat;
                      lngDialog=i.lng;

                    });
                  });
                },),
                IconButton( icon: Icon(
                      Icons.edit_location_outlined,
                      color: Colors.black,
                    ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseLocation(true,i.id)),
                  );
                },),
                IconButton( icon: Icon(
                      Icons.delete_forever,
                      color: Colors.black,
                    ),
                onPressed: (){
                  deleteAddress(username,password,i.id,_key);
                  setState(() {
                    List<Address> addressesDialogtest=[];
                    for(final j in widget.addressesDialog)
                      if(j.id!=i.id)
                        addressesDialogtest.add(j);
                    widget.addressesDialog=  addressesDialogtest;

                  });

                },),
              ],
            ),
          ),
        ),
      );//add any Widget in place of Text("Index $i")
    }
    return list;// all widget added now retrun the list here
  }

}