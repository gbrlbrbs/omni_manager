import 'package:flutter/material.dart';
import 'package:omni_manager/api/firebase.dart';
import 'package:omni_manager/pages/forms/widgets/formulary.dart';


// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems() {
  Map<String, String> mapEmployees =
      Database.listEmployeesMap(); // example {'oi': 'OI', 'ola': 'OLA'};
  print(mapEmployees);
  var map = mapEmployees.entries.toList();
  int numberOfItems = map.length;

  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: map[index].value, //nome do usuário
      expandedValue: map[index]
          .value, //chave de referência user.id : a ser passa para Formulary()
    );
  });
}

/// This is the stateful widget that the main application instantiates.
class ListPanel extends StatefulWidget {
  const ListPanel({Key? key}) : super(key: key);

  @override
  State<ListPanel> createState() => _ListPanelState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ListPanelState extends State<ListPanel> {
  final List<Item> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildPanel(),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: Container(
              alignment: Alignment.center,
              child: Formulary(
                  isManager: true,
                  employee: item
                      .expandedValue)), //example "bOLnQhbXqGdfN9p5r9jpMnoXbgC3")),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
