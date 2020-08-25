import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color widgetBackgroundColor = Color(0xFF1D1F33);
const activeCardColor = Color(0xFF1D1F33);
const inactiveCardColor = Color(0xFF111328);
const Color bottomButtonColor = Color(0xFFEB1555);
const Color baseContentColor = Color(0xFFFDFDFE);

const numberStyle = TextStyle(
  fontSize: 50,
  color: baseContentColor,
  fontWeight: FontWeight.w900,
);

enum Gender {
  male,
  female,
}

const textStyle = TextStyle(
  color: baseContentColor,
  fontSize: 20,
);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int selectedHeight = 140;

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
                        ? activeCardColor
                        : inactiveCardColor,
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
                        ? activeCardColor
                        : inactiveCardColor,
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
              colour: widgetBackgroundColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      'HEIGHT',
                      style: textStyle,
                    ),
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        selectedHeight.toString(),
                        style: numberStyle,
                      ),
                      Text(
                        'cm',
                        style: textStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: bottomButtonColor,
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
                      min: 120,
                      max: 180,
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
                    colour: widgetBackgroundColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: widgetBackgroundColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            width: double.infinity,
            margin: EdgeInsets.only(top: 15.0),
            color: bottomButtonColor,
            child: Center(
              child: Text(
                'Calculate your BMI',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
          color: baseContentColor,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          displayText,
          style: textStyle,
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({this.colour, this.cardChild, this.onTapFunc});

  final Color colour;
  final Widget cardChild;
  final Function onTapFunc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunc,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colour,
        ),
      ),
    );
  }
}
