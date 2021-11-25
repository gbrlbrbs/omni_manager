import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:omni_manager/constants/style.dart';
import 'package:omni_manager/pages/dashboard/widgets/custom_text_content.dart';

/// Example without a datasource
class DataTable2SimpleDemo extends StatelessWidget {
  const DataTable2SimpleDemo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        /*padding: EdgeInsets.all(24),
        margin: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 6),
                color: lightGrey.withOpacity(.1),
                blurRadius: 12)
          ],
          border: Border.all(color: lightGrey, width: .5),
        ),*/
        //padding: const EdgeInsets.all(16),
        child: DataTable2(
            columnSpacing: 6,
            horizontalMargin: 6,
            minWidth: 200,
            columns: [
              DataColumn2(
                label: Text('Column A'),
                size: ColumnSize.S,
              ),
              DataColumn(
                label: Text('Column B'),
              ),
              DataColumn(
                label: Text('Column C'),
              ),
            ],
            rows: List<DataRow>.generate(
                11,
                (index) => DataRow(cells: [
                      DataCell(CustomTextContent(text: "Projetos")),
                      DataCell(CustomTextContent(text: "Maxwell")),
                      DataCell(CustomTextContent(text: "Média da Diretoria")),
                    ]))),
      ),
    );
  }
}
