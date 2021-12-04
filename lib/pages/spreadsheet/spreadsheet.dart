import 'package:flutter/material.dart';
import 'package:omni_manager/pages/dashboard/widgets/custom_text_title.dart';
import 'package:omni_manager/pages/spreadsheet/spreadsheet_table.dart';

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
                child: DataTableWidget(sampleData),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

const sampleData = [
  {
    "name": "Foo",
    "performance": "50",
    "proactivity": "85",
    "work_load": "110",
    "work_completion": "80",
    "work_quality": "65",
  },
  {
    "name": "Bar",
    "performance": "75",
    "proactivity": "5",
    "work_load": "50",
    "work_completion": "100",
    "work_quality": "47",
  },
];
