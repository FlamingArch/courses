import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {

  IconContent({this.label, this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
          color: Color(0xFF0088FF),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          label,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}
