import 'package:chalee/elements/rate/smiley_rating_dialog.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';

class TestDialog extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<TestDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
      onPressed: () {
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return SmileyRatingDialog(
              title: Text('Comment' , textAlign: TextAlign.center,),
              starColor: Colors.yellowAccent,
              isRoundedButtons: true,
              positiveButtonText: 'Ok',
              negativeButtonText: 'Cancel',
              positiveButtonColor: ColorApp.primary,
              negativeButtonColor: ColorApp.primary,
              onCancelPressed: () => Navigator.pop(context),
              onSubmitPressed: (rating) {},
            );
          },
        );
      },
      child: Text('Show Dialog'),
    ));
  }
}
