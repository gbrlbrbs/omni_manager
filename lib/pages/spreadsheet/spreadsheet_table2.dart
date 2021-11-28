import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  final List<Map<String, dynamic>> listOfColumns = [
    {
      "intensidade": "AAAAAA",
      "atribuidas": 1,
      "completadas": 1,
      "taxa_completadas": 1/1,
      "presenca": "Yes",
      "proatividade": "1",
      "participacao": "AAAAAA",
      "taxa_2wks": "AAAAAA",
    },
    {
      "intensidade": "BBBBBB",
      "atribuidas": 2,
      "completadas": 1,
      "taxa_completadas": 1/2,
      "presenca": "no",
      "proatividade": "1",
      "participacao": "AAAAAA",
      "taxa_2wks": "AAAAAA",
    },
    {
      "intensidade": "CCCCCC",
      "atribuidas": 3,
      "completadas": 1,
      "taxa_completadas": 1/3,
      "qualidade": "Yes",
      "proatividade": "1",
      "participacao": "AAAAAA",
      "taxa_2wks": "AAAAAA",
    }
  ];

  get data => null;
//  DataTableWidget(this.listOfColumns);     // Getting the data from outside, on initialization
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Intensidade de carga das tarefas')),
        DataColumn(label: Text('Tarefas atribuídas')),
        DataColumn(label: Text('Tarefas completadas')),
        DataColumn(label: Text('Taxa de completude das tarefas')),
        DataColumn(label: Text('Qualidade das entregas')),
        DataColumn(label: Text('Proatividade')),
        DataColumn(label: Text('Participação')),
        DataColumn(label: Text('Média de completude das últimas 2 semanas')),
      ],
      rows:
          listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
              .map(
                ((element) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(element["intensidade"]!)),
                        DataCell(Text(element["atribuidas"]!)),
                        DataCell(Text(element["completadas"]!)),
                        DataCell(Text(element["taxa_completadas"]!)),
                        DataCell(Text(element["qualidade"]!)),
                        DataCell(Text(element["proatividade"]!)),
                        DataCell(Text(element["participacao"]!)),
                        DataCell(Text(element["taxa_2wks"]!)),
                      ],
                    )),
              )
              .toList(),
    );
  }
}
