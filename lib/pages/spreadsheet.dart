import 'package:flutter/material.dart';
import 'package:omni_manager/pages/dashboard/widgets/custom_text_title.dart';
import 'package:omni_manager/pages/dashboard/widgets/projects.dart';

class SpreadsheetPage extends StatelessWidget {
  const SpreadsheetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Padding(
              padding: EdgeInsets.all(27),
              child: CustomTextTitle(
                text: "Spreadsheets",
                size: 24,
                weight: FontWeight.bold,
              )),
          //Center(child: DataTable2SimpleDemo()),
        ],
      )
    ]);
  }
}