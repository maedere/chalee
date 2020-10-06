import 'package:flutter/material.dart';

class FreeFoodElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
      padding: EdgeInsets.all(8),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image(
            image: AssetImage(
              'assets/images/Indian-Sweet-Potato-1.png',
            ),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "food test 1",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                Text(
                  "food test 1",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Icon(
              Icons.favorite,
              color: Colors.grey,
              size: 12,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Text(
              "554",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
