import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/card_container.dart';
import '../components/icon_content.dart';
import '../components/number_input.dart';
import '../components/bottom_button.dart';
import '../constants.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 68;
  int age = 25;

  // 1 = male, 2 = female
  void updateColor(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardContainer(
                    onPressed: () {
                      updateColor(Gender.Male);
                    },
                    colour: selectedGender == Gender.Male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContentWidget(
                      iconData: FontAwesomeIcons.mars,
                      iconText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: CardContainer(
                    onPressed: () {
                      updateColor(Gender.Female);
                    },
                    colour: selectedGender == Gender.Female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContentWidget(
                      iconData: FontAwesomeIcons.venus,
                      iconText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardContainer(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kBigNumber,
                      ),
                      Text(
                        'cm',
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: kPinkColor,
                      overlayColor: kPinkColorShade,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      inactiveTrackColor: Color(0xFF8D8E88),
                    ),
                    child: Slider(
                      min: 100.0,
                      max: 200.0,
                      value: height.toDouble(),
                      onChanged: (double val) {
                        setState(() {
                          height = val.floor();
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour: Color(0xFF1D1E33),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardContainer(
                    colour: kActiveCardColor,
                    cardChild: NumberInput(
                      number: weight,
                      label: 'WEIGHT',
                      minusCallback: () {
                        setState(() {
                          weight--;
                        });
                      },
                      plusCallback: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: CardContainer(
                    colour: Color(0xFF1D1E33),
                    cardChild: NumberInput(
                      number: age,
                      label: 'AGE',
                      minusCallback: () {
                        setState(() {
                          age--;
                        });
                      },
                      plusCallback: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonBottom(
            onPressed: () {
              CalculatorBrain c = new CalculatorBrain(height: height,weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(bmi: c.calculateBMI(),bmiInterpretation: c.getInterpretation(),bmiText: c.getStrResult(),)));
            },
            text: 'CALCULATE',
          )
        ],
      ),
    );
  }
}
