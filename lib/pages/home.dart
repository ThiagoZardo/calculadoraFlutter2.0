import 'package:calculadora2/components/text_label.dart';
import 'package:calculadora2/repositories/data_repository.dart';
import 'package:calculadora2/services/calculator.dart';
import 'package:calculadora2/services/pessoa.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var dataRepository = DataRepository();
  var nameController = TextEditingController(text: '');
  double weightController = 0.0;
  double heightController = 0.0;

  var _datas = <Person>[];

  void getData() async {
    _datas = await dataRepository.list();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcula IMC'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          nameController.text = '';
          weightController = 0;
          heightController = 0;

          showDialog(context: context, builder: (BuildContext bc) {
            return AlertDialog(
              title: const Text('Vamos calcular seu imc!', style: TextStyle(fontWeight: FontWeight.w600)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const TextLabel(text: 'Digite seu nome:'),
                  TextField(
                    controller: nameController,
                  ),
                  const TextLabel(text: 'Peso:'),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        weightController = double.parse(value);
                      });
                    }
                  ),
                  const TextLabel(text: 'Altura:'),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        heightController = double.parse(value);
                      });
                    },
                  ),
                ]
              ),
              actions: [
                TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: const Text('Voltar')),
                TextButton(onPressed: () async {
                  var calculculaIMC = CalculatorIMC(heightController, weightController);
                  var imc = calculculaIMC.calcular();
                  var result = calculculaIMC.generateResult(imc);
                  await dataRepository.create(nameController.text, weightController, heightController, imc, result);
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  getData();
                  setState(() {});
                }, child: const Text('Calcular'))
              ],
            );
          });
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _datas.length,
                itemBuilder: (BuildContext bc, int index) {
                  var data = _datas[index];
                  return Dismissible(
                    key: Key(data.nome),
                    child: Column(
                      children: [
                        TextLabel(text: "Nome: ${data.nome}"),
                        TextLabel(text: "Altura: ${data.height.toString()}"),
                        TextLabel(text: "Peso: ${data.weight.toString()}"),
                        TextLabel(text: "IMC: ${data.imc.toString()}"),
                        TextLabel(text: "Descrição: ${data.description.toString()}"),
                        const Divider(),
                      ]
                    )
                  );
                },
              )
            )
          ],
        ),
      )
    );
  }
}