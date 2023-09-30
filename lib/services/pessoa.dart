// ignore_for_file: unnecessary_getters_setters

class Person {
  String _name = '';
  double _height = 0;
  double _weight = 0;
  double _imc = 0;
  String _description = '';

  Person(this._name, this._height, this._weight, this._imc, this._description);

  String get nome => _name;
  double get height => _height;
  double get weight => _weight;
  double get imc => _imc;
  String get description => _description;


  set nome(String value) {
    _name = value;
  }

  set height(double value) {
    _height = value;
  }

  set weight(double value) {
    _weight = value;
  }

  set imc(double value) {
    _imc = value;
  }

  set description(String value) {
    _description = value;
  }
}