import 'package:flutter/material.dart';
import 'package:omni_manager/api/auth.dart';

import '../../home.dart';

class Formulary extends StatefulWidget {
  const Formulary({Key? key}) : super(key: key);

  @override
  _FormularyState createState() => _FormularyState();
}

class _FormularyState extends State<Formulary> {
  final formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _employeeNameController = TextEditingController();
  final _employeeEmailController = TextEditingController();

  String textQuestion1 =
      "Intensidade da carga de tarefas atribuídas ao funcionário na semana:";
  String valueQuestion1 = 'Usual';
  var optionsQuestion1 = ['Baixa', 'Usual', 'Alta'];

  String textQuestion2 = "Quanto o funcionário completou das tarefas?";
  String valueQuestion2 = '0%';
  var optionsQuestion2 = ['0%', '25%', '50%', '75%', '100%'];

  String textQuestion3 = "Qual a qualidade da entrega das tarefas?";
  String valueQuestion3 = 'Boa';
  var optionsQuestion3 = ['Ruim', 'Boa', 'Excelente'];

  String textQuestion4 = "O quanto o funcionário foi proativo?";
  String valueQuestion4 = 'Satisfatoriamente';
  var optionsQuestion4 = ['Nada', 'Satisfatoriamente', 'Muito'];

  String textQuestion5 = "O quanto o funcionário foi participativo na semana";
  String valueQuestion5 = 'Nada';
  var optionsQuestion5 = ['Nada', 'Pouco', 'Satisfatorio', 'Muito'];

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
                TextFormField(
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Your e-mail", labelText: "Your e-mail"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _employeeNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Employee name", labelText: "Employee name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter employee name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _employeeEmailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Employee e-mail",
                      labelText: "Employee e-mail"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter employee e-mail';
                    }
                    return null;
                  },
                ),
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
                  height: 30,
                ),
                Text(
                  textQuestion5,
                ),
                DropdownButton<String>(
                  value: valueQuestion5,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: Colors.yellowAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      valueQuestion5 = newValue!;
                    });
                  },
                  items: optionsQuestion5
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
                      bool successfulUpdate = await submitForms(
                          _employeeEmailController.text,
                          valueQuestion1,
                          valueQuestion2,
                          valueQuestion3,
                          valueQuestion4,
                          valueQuestion5);

                      if (successfulUpdate) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Loading...')),
                        );
                        Navigator.pushReplacementNamed(
                            context, HomePage.routeName);
                      }
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
