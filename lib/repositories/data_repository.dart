import 'package:calculadora2/services/pessoa.dart';

class DataRepository {
  final List<Person> _datas = [];

  Future<void> create(
    String name,
    double weight,
    double height,
    double imc,
    String description
  ) async {
    await Future.delayed(const Duration(milliseconds: 0));
    var person = Person(name, weight, height, imc, description);
    _datas.add(person);
  }

  Future<List<Person>> list() async {
    await Future.delayed(const Duration(milliseconds: 0));
    return _datas;
  }
}