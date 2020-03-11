import 'package:flutter/material.dart';
import '../constants.dart';


class IconContentWidget extends StatelessWidget {
  final IconData iconData;
  final String iconText;
  IconContentWidget({@required this.iconData, @required this.iconText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          iconText,
          style: kLabelStyle,
        )
      ],
    );
  }
}