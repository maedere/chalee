
import 'package:chalee/elements/OrderHistoryElement.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
        child: ListView(
          children: [
            OrderHistoryElement(),
            OrderHistoryElement(),
            OrderHistoryElement(),
            OrderHistoryElement(),
            OrderHistoryElement(),
            OrderHistoryElement(),
            OrderHistoryElement(),
            OrderHistoryElement(),
            OrderHistoryElement(),
            OrderHistoryElement(),
            OrderHistoryElement(),
            OrderHistoryElement(),
            OrderHistoryElement(),
            OrderHistoryElement(),
            OrderHistoryElement(),
            OrderHistoryElement(),
            OrderHistoryElement(),
          ],
        ),
    );
  }

}