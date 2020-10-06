library smiley_rating_dialog;

import 'package:chalee/elements/rate/smiley_painter.dart';
import 'package:flutter/material.dart';

class SmileyRatingDialog extends StatefulWidget {

  // Color of star buttons
  final Color starColor;

  // Called when positive button is clicked
  final ValueSetter<int> onSubmitPressed;

  // Called when negative button is clicked
  final VoidCallback onCancelPressed;

  // Text of Positive Button
  final String positiveButtonText;

  // Text of Positive Button
  final String negativeButtonText;

  // Color of Positive Button
  final Color positiveButtonColor;

  // Color of Positive Button
  final Color negativeButtonColor;

  // Title of Dialog
  final Widget title;

  // Whether the corners of the buttons should be rounded or not
  final bool isRoundedButtons;

  SmileyRatingDialog(
      {this.starColor = Colors.yellow,
      this.title,
      @required this.onSubmitPressed,
      @required this.onCancelPressed,
      @required this.positiveButtonText,
      @required this.negativeButtonText,
      this.isRoundedButtons = true,
      this.positiveButtonColor = Colors.amber,
      this.negativeButtonColor = Colors.amber});

  @override
  _SmileyRatingDialogState createState() => _SmileyRatingDialogState();
}

class _SmileyRatingDialogState extends State<SmileyRatingDialog> {
  int _rating = 0;

  List<Widget> _starWidgets() {
    List<Widget> buttons = [];

    for (int rateValue = 1; rateValue <= 5; rateValue++) {
      final starRatingButton = GestureDetector(
        onTap: (){
          setState(() {
            _rating = rateValue;
          });
        },
        child: Image(
          image: _rating >= rateValue ? AssetImage("assets/images/star1.png") : AssetImage("assets/images/star.png"),
          width: 32,height: 32,
        ),
      );

      buttons.add(starRatingButton);
    }

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: widget.title,
      titleTextStyle: TextStyle(color: Colors.grey[500] , fontFamily: "main"),
      contentPadding: EdgeInsets.all(20.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
           decoration: BoxDecoration(
             image: DecorationImage(image: _rating==1 ?
             AssetImage("assets/images/angry.png") : _rating == 2 ?
             AssetImage("assets/images/cry.png") : _rating == 3 ?
             AssetImage("assets/images/sad.png") : _rating == 4 ?
             AssetImage("assets/images/smile.png") :
             AssetImage("assets/images/love.png") )
           ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _starWidgets()),
          SizedBox(height: 10,),
          //edit by saeed hosseni
      TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "insert your comment"
        ),
      ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        widget.isRoundedButtons ? 4.0 : 0.0)),
                color: widget.positiveButtonColor,
                onPressed: () {
                  widget.onSubmitPressed(_rating);
                },
                child: Text(widget.positiveButtonText),
              ),
              FlatButton(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        widget.isRoundedButtons ? 4.0 : 0.0)),
                color: widget.negativeButtonColor,
                onPressed: () {
                  widget.onCancelPressed();
                },
                child: Text(widget.negativeButtonText),
              ),
            ],
          )
        ],
      ),
    );
  }
}
