import 'package:chalee/elements/TabHistory/Company.dart';
import 'package:chalee/elements/TabHistory/Order.dart';
import 'package:chalee/elements/TabHistory/Product.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';

class HistoryActivity extends StatefulWidget {
  @override
  _HistoryActivityState createState() => _HistoryActivityState();
}

class _HistoryActivityState extends State<HistoryActivity> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: ColorApp.primary,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyle(fontFamily: "main"),
            unselectedLabelStyle: TextStyle(fontFamily: "main"),
            indicatorColor: ColorApp.primary,
            tabs: [
              Tab(text: "Orders",),
              Tab(text: " Company",),
              Tab(text: " Product",),
            ],
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('History' , style: TextStyle(color: Colors.black , fontFamily: "main"),),
        ),
        body: TabBarView(
          children: [
            OrderHistory(),
            Company(),
            Product(),
          ],
        ),
      ),
    );
  }
}
