import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  final List<Map<String, dynamic>> listOfColumns = [
    {
      "media": "AAAAAA",
      "atividade": "1",
      "presenca": "Yes",
      "participacao": "AAAAAA",
      "proatividade": "1",
      "solicitude": "Yes",
      "media_2wks": "AAAAAA",
      "nao_recebeu": "1"
    },
    {
      "media": "BBBBBB",
      "atividade": "2",
      "presenca": "no",
      "participacao": "AAAAAA",
      "proatividade": "1",
      "solicitude": "Yes",
      "media_2wks": "AAAAAA",
      "nao_recebeu": "1"
    },
    {
      "media": "CCCCCC",
      "atividade": "3",
      "presenca": "Yes",
      "participacao": "AAAAAA",
      "proatividade": "1",
      "solicitude": "Yes",
      "media_2wks": "AAAAAA",
      "nao_recebeu": "1"
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
        DataColumn(label: Text('Solicitude')),
        DataColumn(label: Text('Média últimas 2 semanas')),
        DataColumn(label: Text('% de Não Recebeu Tarefas')),
      ],
      rows:
          listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
              .map(
                ((element) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(element["media"]!)),
                        DataCell(Text(element["atividade"]!)),
                        DataCell(Text(element["presenca"]!)),
                        DataCell(Text(element["participacao"]!)),
                        DataCell(Text(element["proatividade"]!)),
                        DataCell(Text(element["solicitude"]!)),
                        DataCell(Text(element["media_2wks"]!)),
                        DataCell(Text(element["nao_recebeu"]!)),
                      ],
                    )),
              )
              .toList(),
    );
  }
}
