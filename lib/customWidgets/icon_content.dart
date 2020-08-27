import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final IconData genderIcon;
  final String displayText;

  const IconContent({Key key, this.genderIcon, this.displayText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 70,
          color: kBaseContentColor,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          displayText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
