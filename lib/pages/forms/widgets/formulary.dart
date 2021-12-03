import 'package:flutter/material.dart';
import 'package:omni_manager/api/firebase.dart';

import '../../home.dart';

class Formulary extends StatefulWidget {
  const Formulary({Key? key}) : super(key: key);

  @override
  _FormularyState createState() => _FormularyState();
}

class _FormularyState extends State<Formulary> {
  final formKey = GlobalKey<FormState>();

  String textQuestion1 =
      "Quantidade de tarefas atribuídas ao funcionário na semana:";
  String valueQuestion1 = '0';
  var optionsQuestion1 = ['0', '1', '2', '3', '4', '5'];

  String textQuestion2 = "Quantidade de tarefas que o funcionário completou:";
  String valueQuestion2 = '0';
  var optionsQuestion2 = ['0', '1', '2', '3', '4', '5'];

  String textQuestion3 = "Qual a qualidade da entrega das tarefas?";
  String valueQuestion3 = 'Regular';
  var optionsQuestion3 = ['Péssima', 'Ruim', 'Regular', 'Boa', 'Excelente'];

  String textQuestion4 = "O quanto o funcionário foi proativo?";
  String valueQuestion4 = 'Satisfatorio';
  var optionsQuestion4 = ['Nada', 'Pouco', 'Satisfatorio', 'Muito'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Form(
        key: formKey,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Text(
                  textQuestion1,
                ),
                DropdownButton<String>(
                  value: valueQuestion1,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: Colors.yellowAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      valueQuestion1 = newValue!;
                    });
                  },
                  items: optionsQuestion1
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  textQuestion2,
                ),
                DropdownButton<String>(
                  value: valueQuestion2,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: Colors.yellowAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      valueQuestion2 = newValue!;
                    });
                  },
                  items: optionsQuestion2
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  textQuestion3,
                ),
                DropdownButton<String>(
                  value: valueQuestion3,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: Colors.yellowAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      valueQuestion3 = newValue!;
                    });
                  },
                  items: optionsQuestion3
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  textQuestion4,
                ),
                DropdownButton<String>(
                  value: valueQuestion4,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: Colors.yellowAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      valueQuestion4 = newValue!;
                    });
                  },
                  items: optionsQuestion4
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      int param1 = optionsQuestion1.indexOf(valueQuestion1);
                      double load = param1 / (optionsQuestion1.length - 1);
                      int param2 = optionsQuestion2.indexOf(valueQuestion2);
                      double completion = param1 / param2;
                      double quality =
                          optionsQuestion3.indexOf(valueQuestion3) /
                              (optionsQuestion3.length - 1);
                      double proactivity =
                          optionsQuestion4.indexOf(valueQuestion4) /
                              (optionsQuestion4.length - 1);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Loading...')),
                      );
                      Database.fillForms()
                          ?.then((value) => {
                                Navigator.pushReplacementNamed(
                                    context, HomePage.routeName)
                              })
                          .catchError((error) => print("Fail: $error"));
                    }
                  },
                  child: Text("Submit Answer"),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomePage.routeName);
                  },
                  child: Text("Back"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
