import 'package:flutter/material.dart';
import '../constants.dart';
class ButtonBottom extends StatelessWidget {
  final Function onPressed;
  final String text;
  ButtonBottom({@required this.onPressed,@required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(child: Text(text,style: kButtonLabelStyle,)),
        color: kPinkColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 60,
      ),
    );
  }
}