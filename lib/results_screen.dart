import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/ResuableCard.dart';
import 'bottom_Button.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Your Results',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    children: [
                      Text(
                        'Normal',
                        style: kLabelTextStyle.copyWith(
                          color: Colors.green,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '22.1',
                        style: kLabelNumberStyle.copyWith(
                          fontSize: 70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                displayText: 'Recalculate BMI',
              )
            ],
          ),
        ));
  }
}
