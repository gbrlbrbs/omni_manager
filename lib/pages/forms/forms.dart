import 'package:flutter/material.dart';
import 'package:omni_manager/pages/forms/widgets/formulary.dart';
import 'package:omni_manager/pages/home.dart';
import 'package:omni_manager/api/auth.dart';

import '../dashboard/widgets/custom_text_title.dart';

class FormsPage extends StatefulWidget {
  static const String routeName = "/forms";
  @override
  _FormsPageState createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 15),
              child: CustomTextTitle(
                text: "Formularies",
                size: 24,
                weight: FontWeight.bold,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(alignment: Alignment.center, child: Formulary()),
          ),
        ]);
  }
}
