import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.text, @required this.onTap});
  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
