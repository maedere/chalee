import 'package:chalee/elements/rate/smiley_rating_dialog.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Text(
                  "1 Review   ",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "main",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //one model
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage("assets/images/smile.png",),),
                      ),
                    ),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "  Monday , june 8th 2020 , 03:46 - ryaz",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "main",
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "  hi , very good",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "main",
                          ),
                        ),
                      ],
                    ),)
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage("assets/images/cry.png",),),
                      ),
                    ),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "  saturday , june 12th 2020 , 03:46 - naser",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "main",
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "i hated",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "main",
                          ),
                        ),
                      ],
                    ),)
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 20),
                onPressed: () {
                  print("clciked");
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return SmileyRatingDialog(
                          title: Text(
                            'Comment',
                            textAlign: TextAlign.center,
                          ),
                          starColor: Colors.yellowAccent,
                          isRoundedButtons: true,
                          positiveButtonText: 'Ok',
                          negativeButtonText: 'Cancel',
                          positiveButtonColor: ColorApp.primary,
                          negativeButtonColor: ColorApp.primary,
                          onCancelPressed: () => Navigator.pop(context),
                          onSubmitPressed: (rating) {Navigator.pop(context);},
                        );
                      });
                },
                child: Text(
                  "Write Review",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "main",
                  ),
                ),
                color: ColorApp.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
