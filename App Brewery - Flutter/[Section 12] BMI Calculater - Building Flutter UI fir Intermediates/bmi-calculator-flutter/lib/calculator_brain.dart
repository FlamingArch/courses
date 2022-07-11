import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  int height;
  int weight;

  double _bmi;
  String calculateBMI() {
    double _bmi = weight / pow(height, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretations() {
    if (_bmi >= 25)
      return 'You\'re Overweight. Run bitch run...';
    else if (_bmi > 18.5)
      return 'You\'re Normal. Stop crying with your insecurities and decide how you\'re gonna fuck it up...';
    else
      return 'You\'re Underweight. Eat Bitch Eat.';
  }
}
