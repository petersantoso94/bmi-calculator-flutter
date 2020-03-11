import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

   CalculatorBrain({this.weight,this.height});

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return  _bmi.toStringAsFixed(1);
  }

  String getStrResult(){
    return _bmi <= 18.5 ? "Underweight" : _bmi < 25 ? 'Normal' : 'Overweight';
  }

  String getInterpretation(){
    return _bmi <= 18.5 ? "You can eat a bit more!" : _bmi < 25 ? 'Good job!' : 'Do more exercise';
  }
}