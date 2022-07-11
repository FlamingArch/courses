import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          sliderTheme: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.black,
              inactiveTrackColor: Color(0xFF8D8E98),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
              thumbColor: Colors.blue,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
              overlayColor: Color(0X290066FF)),
          accentColor: Colors.white,
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.blue,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black))),
      home: InputPage(),
    );
  }
}
