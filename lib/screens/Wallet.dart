import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  String wallet="";

  Wallet(this.wallet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(
                context,
              );
            }),
        centerTitle: true,
        title: Text(
          "Wallet",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "main",
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: ColorApp.primary,
              child: Center(
                child: Text(
                  wallet,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "main",
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black), color: Colors.white),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration.collapsed(
                  hintText: "Enter the amount : \$10",
                  hintStyle: TextStyle(fontSize: 14, fontFamily: "main")),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () => {},
            child: Text("CHARGING WALLET" , style: TextStyle(color: Colors.white , fontFamily: "main" , fontWeight: FontWeight.bold,),),
            color: ColorApp.primary,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
