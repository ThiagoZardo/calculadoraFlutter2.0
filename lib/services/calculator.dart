// ignore_for_file: unnecessary_getters_setters

import 'dart:math';

class CalculatorIMC {
  double _height = 0;
  double _weight = 0;

  CalculatorIMC(this._height, this._weight);

  double get height => _height;
  double get weight => _weight;

  set weight(double value) {
    _weight = value;
  }

  set height(double value) {
    _height = value;
  }

  double calcular() {
    double imc = _weight / pow(_height, 2);
    return imc * 10000;
  }

  String generateResult(double imc) {
    var text = '';
    if (imc < 16) {
      text = 'Magreza grave';
    } else if (imc < 17) {
      text = 'Magreza moderada';
    } else if (imc < 18.5) {
      text = 'Magreza leve';
    } else if (imc < 25) {
      text = 'Saudável';
    } else if (imc < 30) {
      text = 'Sobrepeso';
    } else if (imc < 35) {
      text = 'Obesidade Grau I';
    } else if (imc < 40) {
      text = 'Obesidade Grau II';
    } else if (imc > 40) {
      text = 'Obesidade Grau III';
    }
    return text;
  }
}