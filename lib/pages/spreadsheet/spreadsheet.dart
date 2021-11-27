import 'package:flutter/material.dart';
import 'package:omni_manager/pages/dashboard/widgets/custom_text_title.dart';
//import 'package:omni_manager/pages/spreadsheet/spreadsheet_table.dart';
import 'package:omni_manager/pages/spreadsheet/spreadsheet_table2.dart';

class SpreadsheetPage extends StatelessWidget {
  const SpreadsheetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 15),
                child: CustomTextTitle(
                  text: "Spreadsheet",
                  size: 40,
                  weight: FontWeight.bold,
                )),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Center(
                child: DataTableWidget(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
