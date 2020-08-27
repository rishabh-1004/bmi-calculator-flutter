import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/bmi-calculator-flutter/lib/customWidgets/ResuableCard.dart';
import '../customWidgets/bottom_Button.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String bmiValue;
  final String display_message;

  const ResultPage(
      {@required this.result,
      @required this.bmiValue,
      @required this.display_message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Container(
          width: double.infinity,
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
                  colour: kWidgetBackgroundColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        result.toUpperCase(),
                        style: kLabelTextStyle.copyWith(
                          color: Colors.green,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        bmiValue,
                        style: kLabelNumberStyle.copyWith(
                          fontSize: 70,
                        ),
                      ),
                      Text(
                        display_message,
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                displayText: 'Recalculate BMI',
                onCardTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
    ;
  }
}
