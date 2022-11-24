import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.peso, required this.altura});

  final int altura;
  final int peso;

  double? _imc;

  String calcImc() {
    _imc = peso / pow(altura / 100, 2);
    return _imc!.toStringAsFixed(1);
  }

  dynamic getResult() {
    if (_imc! >= 25) {
      return 'Excesso de peso';
    } else if (_imc! > 18.5) {
      return 'Normal';
    } else {
      return "Abaixo do peso";
    }
  }

  String getInterpretation() {
    if (_imc! >= 25) {
      return 'Você tem um peso corporal acima do normal. Tente se exercitar mais.';
    } else if (_imc! >= 18.8) {
      return 'Você tem um peso corporal normal. Bom trabalho!';
    } else {
      return 'Você tem um peso corporal abaixo do normal. Você pode comer um pouco mais.';
    }
  }
}
