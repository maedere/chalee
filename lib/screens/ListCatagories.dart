import 'package:chalee/model/local/MainCatagory.dart';
import 'package:chalee/screens/KoponActivity.dart';
import 'package:chalee/screens/MainActivity.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ListCatagories extends StatelessWidget {
  List<MainCatagory> mains = [
    MainCatagory(id: 0, title: "Restaurant", url: "assets/images/resturant.png"),
/*    MainCatagory(id: 1, title: "Grecory", url: "assets/images/super1.png"),
    MainCatagory(id: 2, title: "Pharmacy", url: "assets/images/zzz.png"),
    MainCatagory(id: 3, title: "Electronic", url: "assets/images/harware.png"),
    MainCatagory(id: 4, title: "NurSery", url: "assets/images/x3.png"),
    MainCatagory(id: 5, title: "PetStore", url: "assets/images/petstore.png"),
    MainCatagory(id: 6, title: "Fashion", url: "assets/images/fashion.png"),
    MainCatagory(id: 7, title: "Perfume", url: "assets/images/perfume.png"),
    MainCatagory(id: 8, title: "Hardware", url: "assets/images/hardware.png"),*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: ColorApp.primary,
        child: ListView.builder(
            itemCount: mains.length,
            padding: EdgeInsets.symmetric(vertical: 20),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, i) {
              return _list(context, mains[i]);
            }),
      )),
    );
  }

  Widget _list(BuildContext context, MainCatagory main) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.5,
      child: Center(
        child: Column(
          children: [

            SizedBox(
              height: 10,
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> KoponActivity(),),);
                },
                child: Column(
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.7),
                            shape: BoxShape.circle
                        ),
                        child:  Column(
                          children: [
                            Lottie.asset('assets/animation/lottile/kopen.json' , width: 50 , height: 50 , fit: BoxFit.fill),
                          ],
                        )
                    ),
                    Text("coupon" , style: TextStyle(color: Colors.white , fontFamily:"main"),)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                print("here");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainActivity(mainCatagory: main,)),
                );
              },
              child: Image(
                image: AssetImage(main.url),
                width: 150,
                height: 150,
              ),
            ),
            Text(
              main.title,
              style: TextStyle(fontSize: 18, color: Colors.white , fontFamily: "main"),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                thickness: 3,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
