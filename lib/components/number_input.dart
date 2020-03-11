import 'package:flutter/material.dart';
import '../constants.dart';
import 'round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NumberInput extends StatelessWidget {
  const NumberInput(
      {@required this.number,
      @required this.label,
      @required this.plusCallback,
        @required this.minusCallback,});

  final int number;
  final String label;
  final Function plusCallback;
  final Function minusCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: kLabelStyle,
        ),
        Text(
          number.toString(),
          style: kBigNumber,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: plusCallback,
            ),
            SizedBox(
              width: 10,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: minusCallback,
            ),
          ],
        ),
      ],
    );
  }
}
