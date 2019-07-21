import 'dart:math';

class CalcBrain {
  final int height;
  final int weight;

  double _bmi;

  CalcBrain(this.height, this.weight);

  String calcBmi() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getAdvices() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight, try to exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight, good job!';
    } else {
      return 'You have a lower than normal body weight, you can eat a bit more';
    }
  }
}
