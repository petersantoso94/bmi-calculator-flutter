import 'package:bmi_calculator/components/card_container.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/card_container.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String bmiText;
  final String bmiInterpretation;

  ResultPage({@required this.bmi,@required this.bmiInterpretation,@required this.bmiText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Your Result',
                style: kTitle,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: CardContainer(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiText,
                    style: kResultTitle,
                  ),
                  Text(
                    bmi,
                    style: kNumberResult,
                  ),
                  Text(
                    bmiInterpretation,
                    style: kTextResult,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: ButtonBottom(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                text: 'RE-CALCULATE BMI',
              )),
        ],
      ),
    );
  }
}
