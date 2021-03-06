import 'package:bmi_calculator/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../customWidgets/icon_content.dart';
import '../customWidgets/ResuableCard.dart';
import '../customWidgets/bottom_Button.dart';
import '../BMIBrain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int selectedHeight = 140;
  int selectedWeight = 70;
  int selectedage = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTapFunc: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? KActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      genderIcon: FontAwesomeIcons.mars,
                      displayText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTapFunc: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? KActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      genderIcon: FontAwesomeIcons.venus,
                      displayText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kWidgetBackgroundColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        selectedHeight.toString(),
                        style: kLabelNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kBottomButtonColor,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: selectedHeight.toDouble(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedHeight = newValue.toInt();
                        });
                      },
                      min: 150,
                      max: 200,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kWidgetBackgroundColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          selectedWeight.toString(),
                          style: kLabelNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              mainIcon: Icons.remove,
                              task: () {
                                setState(() {
                                  selectedWeight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              mainIcon: Icons.add,
                              task: () {
                                setState(() {
                                  selectedWeight++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kWidgetBackgroundColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          selectedage.toString(),
                          style: kLabelNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              mainIcon: Icons.remove,
                              task: () {
                                setState(() {
                                  selectedage--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              mainIcon: Icons.add,
                              task: () {
                                setState(() {
                                  selectedage++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onCardTap: () {
              CalculateBMI bmi =
                  CalculateBMI(height: selectedHeight, weight: selectedWeight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    result: bmi.getResult(),
                    display_message: bmi.getComment(),
                    bmiValue: bmi.getBMI(),
                  ),
                ),
              );
            },
            displayText: 'Calculate your BMI',
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({this.mainIcon, this.task});

  final IconData mainIcon;
  final Function task;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: task,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(
        mainIcon,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
