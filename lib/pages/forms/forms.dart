import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:omni_manager/pages/forms/widgets/formulary.dart';
import 'package:omni_manager/pages/home.dart';
import 'package:omni_manager/api/auth.dart';
import 'package:omni_manager/api/firebase.dart';

import '../dashboard/widgets/custom_text_title.dart';

class FormsPage extends StatefulWidget {
  static const String routeName = "/forms";
  @override
  _FormsPageState createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  List<bool> _panels = [];

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
            child: Container(
                alignment: Alignment.center,
                child: FutureBuilder<QuerySnapshot>(
                    future: Database.listEmployees(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      } else if (snapshot.hasData || snapshot.data != null) {
                        _panels = List.generate(snapshot.data!.size,
                            (index) => _panels[index] = false);
                        return ExpansionPanelList(
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              _panels[index] = !_panels[index];
                            });
                          },
                          children: snapshot.data!.docs
                              .asMap()
                              .map((index, item) => MapEntry(
                                  index,
                                  ExpansionPanel(
                                      headerBuilder: (BuildContext context,
                                          bool isExpanded) {
                                        return ListTile(
                                          title: Text('Título'),
                                        );
                                      },
                                      body: ListTile(
                                        title: Text('conteúdo'),
                                      ),
                                      isExpanded: _panels[index])))
                              .values
                              .toList(),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    })),
          ),
        ]);
  }
}
