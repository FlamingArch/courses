import 'constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        color: Color(0x40000000),
        height: kbottomContainerHeight,
        margin: EdgeInsets.only(
          top: 16,
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
