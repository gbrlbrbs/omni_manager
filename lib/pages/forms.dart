import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:omni_manager/api/firebase.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: Database.listRatings(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Something went wrong');
              } else if (snapshot.hasData || snapshot.data != null) {
                print('ratings');
                print(snapshot.data!.docs);
                snapshot.data!.docs.forEach((element) {
                  print("id: ${element.id} data: ${(element.get(FieldPath(['release_date'])) as Timestamp).toDate()}");
                });
                return Text('see console');
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
        Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: Database.listEmployees(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Something went wrong');
              } else if (snapshot.hasData || snapshot.data != null) {
                print('employees');
                print(snapshot.data!.docs);
                snapshot.data!.docs.forEach((DocumentSnapshot element) async {
                  final DocumentSnapshot data = await Database.getEmployeeData(element);
                  print("id: ${element.id} \n employee: ${data.get(FieldPath(['name']))}");
                });
                // Database.releaseForms();
                return Text('see console');
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}
