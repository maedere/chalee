import 'package:chalee/elements/FreeFoodEelement.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';

class FreeFoodActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    5,
                  ),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    onPressed: null,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Food Free",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.close,
                    color: ColorApp.primary,
                  ),
                ],
              ),
            ),

            //todo test
            FreeFoodElement(),
            FreeFoodElement(),
            FreeFoodElement(),
            FreeFoodElement(),
            FreeFoodElement(),
            FreeFoodElement(),
          ],
        ),
      ),
    );
  }
}
