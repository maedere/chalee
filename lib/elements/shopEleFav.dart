import 'package:chalee/model/json/ShopModel.dart';
import 'package:chalee/screens/ShopDetailActiivty.dart';
import 'package:flutter/material.dart';

class ShopEleFav extends StatelessWidget{

  final String id;

  ShopEleFav({@required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShopDetailActivity(shop: Shop(shopId: "0"))),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 10),
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Hero(
              tag: "saeed" + id.toString(),
              child: Image(
                image: AssetImage(
                  'assets/images/logoo.jpg',
                ),
                width: 80,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Test shop",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  Text(
                    "shop test 1",
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.favorite,
              color: Colors.red,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

}