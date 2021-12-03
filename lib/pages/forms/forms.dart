import 'package:flutter/material.dart';
import 'package:omni_manager/pages/forms/widgets/formulary.dart';
//import 'package:omni_manager/api/firebase.dart';

import '../dashboard/widgets/custom_text_title.dart';

class FormsPage extends StatefulWidget {
  static const String routeName = "/forms";
  @override
  _FormsPageState createState() => _FormsPageState();
}

bool loggedUserIsManager =
    true; //Import from firebase.dart Database in Dell's OM-35 code

class _FormsPageState extends State<FormsPage> {
  @override
  Widget build(BuildContext context) {
    if (loggedUserIsManager)
      return Scaffold(
          body: Center(
        child: ListView(
          //mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.start,
          shrinkWrap: true,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 15),
                child: CustomTextTitle(
                  text: "Formularies for Managers",
                  size: 24,
                  weight: FontWeight.bold,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                alignment: Alignment.center,
                child: Formulary(),
              ),
            ),
          ],
        ),
      ));
    else
      return Scaffold(
          body: Center(
        child: ListView(
          //mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.start,
          shrinkWrap: true,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 15),
                child: CustomTextTitle(
                  text: "Formularies for Employees",
                  size: 24,
                  weight: FontWeight.bold,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                alignment: Alignment.center,
                child: Formulary(),
              ),
            ),
          ],
        ),
      ));
  }
}
