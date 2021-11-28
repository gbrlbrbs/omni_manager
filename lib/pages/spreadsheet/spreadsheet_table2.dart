import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  final List<Map<String, String>> listOfColumns = [
    {
      "Item1": "AAAAAA",
      "Item2": "1",
      "Item3": "Yes",
      "Item4": "AAAAAA",
      "Item5": "1",
      "Item6": "Yes",
      "Item7": "AAAAAA",
      "Item8": "1"
    },
    {
      "Item1": "BBBBBB",
      "Item2": "2",
      "Item3": "no",
      "Item4": "AAAAAA",
      "Item5": "1",
      "Item6": "Yes",
      "Item7": "AAAAAA",
      "Item8": "1"
    },
    {
      "Item1": "CCCCCC",
      "Item2": "3",
      "Item3": "Yes",
      "Item4": "AAAAAA",
      "Item5": "1",
      "Item6": "Yes",
      "Item7": "AAAAAA",
      "Item8": "1"
    }
  ];

  get data => null;
//  DataTableWidget(this.listOfColumns);     // Getting the data from outside, on initialization
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Média')),
        DataColumn(label: Text('Fez atividade')),
        DataColumn(label: Text('Presente na reunião')),
        DataColumn(label: Text('Participação')),
        DataColumn(label: Text('Proatividade')),
        DataColumn(label: Text('Whatsapp')),
        DataColumn(label: Text('Média últimas 2 semanas')),
        DataColumn(label: Text('% de Não Recebeu Tarefas')),
      ],
      rows:
          listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
              .map(
                ((element) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(element["Item1"]!)),
                        DataCell(Text(element["Item2"]!)),
                        DataCell(Text(element["Item3"]!)),
                        DataCell(Text(element["Item4"]!)),
                        DataCell(Text(element["Item5"]!)),
                        DataCell(Text(element["Item6"]!)),
                        DataCell(Text(element["Item7"]!)),
                        DataCell(Text(element["Item8"]!)),
                      ],
                    )),
              )
              .toList(),
    );
  }
}
