import 'package:flutter/material.dart';
import 'package:omni_manager/pages/forms/widgets/formulary.dart';
import 'package:omni_manager/api/firebase.dart';

import '../dashboard/widgets/custom_text_title.dart';

class FormsPage extends StatefulWidget {
  static const String routeName = "/forms";
  @override
  _FormsPageState createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        alignment: Alignment.topLeft,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextTitle(
                    text: "Formularies",
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Loading...')),
                        );
                        Database.releaseForms().then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Forms released successfully!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        }).catchError((err) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Failed to release. Error: $err"),
                              backgroundColor: Colors.red,
                            ),
                          );
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        });
                      },
                      child: Text("Release Forms"))
                ],
              ),
              Container(
                  alignment: Alignment.center,
                  child: Formulary(
                      isManager: true,
                      employee: "bOLnQhbXqGdfN9p5r9jpMnoXbgC3")), // example
            ]),
      ),
    );
  }
}
