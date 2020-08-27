import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onCardTap;
  final String displayText;

  const BottomButton({this.onCardTap, this.displayText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        height: 70,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15.0),
        color: kBottomButtonColor,
        child: Center(
          child: Text(
            displayText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
