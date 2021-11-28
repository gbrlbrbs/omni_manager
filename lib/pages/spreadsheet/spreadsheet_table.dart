import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:omni_manager/constants/style.dart';

/// Example without a datasource
class SpreadsheetTableSimple extends StatelessWidget {
  const SpreadsheetTableSimple();

  @override
  Widget build(BuildContext context) {
    const _verticalDivider = const VerticalDivider(
      color: Colors.black,
      thickness: 1,
    );

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: normalYellow,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 6),
                color: lightGrey.withOpacity(.1),
                blurRadius: 12)
          ],
          border: Border.all(color: lightGrey, width: .5),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.black,
          ),
          child: DataTable(
            dividerThickness: 1.0,
            dataRowHeight: 32.0,
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Média',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black),
                ),
              ),
              DataColumn(label: _verticalDivider),
              DataColumn(
                label: Text(
                  'Fez atividade',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black),
                ),
              ),
              DataColumn(label: _verticalDivider),
              DataColumn(
                label: Text(
                  'Presente na reunião',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black),
                ),
              ),
              DataColumn(label: _verticalDivider),
              DataColumn(
                label: Text(
                  'Participação',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black),
                ),
              ),
              DataColumn(label: _verticalDivider),
              DataColumn(
                label: Text(
                  'Proatividade',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black),
                ),
              ),
              DataColumn(label: _verticalDivider),
              DataColumn(
                label: Text(
                  'Whatsapp',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black),
                ),
              ),
              DataColumn(label: _verticalDivider),
              DataColumn(
                label: Text(
                  'Média das últimas 2 semanas',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black),
                ),
              ),
              DataColumn(label: _verticalDivider),
              DataColumn(
                label: Text(
                  '% de Não recebeu Tarefas',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black),
                ),
              ),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text(
                    'Sarah',
                    style: TextStyle(color: Colors.black),
                  )),
                  DataCell(_verticalDivider),
                  DataCell(Text(
                    '19',
                    style: TextStyle(color: Colors.black),
                  )),
                  DataCell(_verticalDivider),
                  DataCell(Text(
                    'Student',
                    style: TextStyle(color: Colors.black),
                  )),
                  DataCell(_verticalDivider),
                  DataCell(Text(
                    'Student',
                    style: TextStyle(color: Colors.black),
                  )),
                  DataCell(_verticalDivider),
                  DataCell(Text(
                    'Student',
                    style: TextStyle(color: Colors.black),
                  )),
                  DataCell(_verticalDivider),
                  DataCell(Text(
                    'Student',
                    style: TextStyle(color: Colors.black),
                  )),
                  DataCell(_verticalDivider),
                  DataCell(Text(
                    'Student',
                    style: TextStyle(color: Colors.black),
                  )),
                  DataCell(_verticalDivider),
                  DataCell(Text(
                    'Student',
                    style: TextStyle(color: Colors.black),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
