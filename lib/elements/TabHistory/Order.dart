
import 'package:chalee/elements/OrderHistoryElement.dart';
import 'package:chalee/services/api.dart';
import 'package:flutter/material.dart';
class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getOrder(
      "989135083446","654321","0"
    , _key).then((value){
      setState(() {
      for(final i in value)
          print(i);

      });
    });    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: ListView(
        children: [
          OrderHistoryElement("123","dd","dd"),
        ],
      ),
    );
  }
}

