import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  final List<Map<String, String>> listOfColumns;

  DataTableWidget(this.listOfColumns);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Nome')),
        DataColumn(label: Text('Média geral (%)')),
        DataColumn(label: Text('Proatividade (%)')),
        DataColumn(label: Text('Carga de trabalho (%)')),
        DataColumn(label: Text('Entregas realizadas (%)')),
        DataColumn(label: Text('Qualidade do trabalho (%)')),
        // TODO: next steps
        // DataColumn(label: Text('Média gerente')),
        // DataColumn(label: Text('Média autoavaliação')),
      ],
      rows:
          listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
              .map(
                ((element) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(element["name"]!)),
                        DataCell(Text(element["performance"]!)),
                        DataCell(Text(element["proactivity"]!)),
                        DataCell(Text(element["work_load"]!)),
                        DataCell(Text(element["work_completion"]!)),
                        DataCell(Text(element["work_quality"]!)),
                        // DataCell(Text(element["Item7"]!)),
                        // DataCell(Text(element["Item8"]!)),
                      ],
                    )),
              )
              .toList(),
    );
  }
}
