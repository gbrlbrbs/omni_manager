import 'package:flutter/material.dart';
import 'package:omni_manager/pages/forms/widgets/formulary.dart';
import 'package:omni_manager/api/firebase.dart';
import 'package:omni_manager/pages/forms/widgets/list_panel.dart';
import '../dashboard/widgets/custom_text_title.dart';

class FormsPage extends StatefulWidget {
  static const String routeName = "/forms";
  @override
  _FormsPageState createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  var employees = Database.listEmployees();

  final List<Item> _data = generateItems(); //from list_panels

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
                                content: Text("Failed to release. Error: $err"),
                                backgroundColor: Colors.red,
                              ),
                            );
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          });
                        },
                        child: Text("Release Forms")),
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _data[index].isExpanded = !isExpanded;
                        });
                      },
                      children: _data.map<ExpansionPanel>((Item item) {
                        return ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(item.headerValue),
                            );
                          },
                          body: Container(
                              alignment: Alignment.center,
                              child: Formulary(
                                  isManager: true,
                                  employee:
                                      "bOLnQhbXqGdfN9p5r9jpMnoXbgC3")), //item.expandedValue
                          isExpanded: item.isExpanded,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ]),
        ));
  }
}
