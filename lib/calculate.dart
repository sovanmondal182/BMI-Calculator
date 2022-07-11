import 'dart:math';

class Calculate {
  Calculate({required this.height, required this.weight});
  final int height;
  final int weight;

  late double _bmi;
  String calculateBMI() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String calculateResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Healthy';
    } else {
      return 'Underweight';
    }
  }

  String calculateText() {
    if (_bmi >= 25) {
      return 'A BMI of above 25 indicates that your weight is higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'A BMI of 18 - 24.9 indicates that you\'re in a good place. Keep up your healthy habits!';
    } else {
      return 'A BMI of below 18 indicates that your weight is lower than normal body weight. You can eat a bit more.';
    }
  }
}
