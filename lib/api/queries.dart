import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String docID;

  GetUserName(this.docID);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection("Users");

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(this.docID).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Snapshot error: ${snapshot.error}");
            return Text("Something went wrong");
          }
          if (snapshot.hasData && !(snapshot.data!.exists)) {
            return Text("No data has been retrieved");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text("${data['name']}");
          }

          return Text("Loading...");
        });
  }
}

Future<bool> validateManagerEmail(String managerEmail) async {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  // flow: vai encontrar o doc com email, determinar se existe e retornar um bool
  return users
      .where('email', isEqualTo: managerEmail)
      .limit(1)
      .get()
      .then((snapshot) {
    if (snapshot.docs[0].exists) {
      return true;
    }
    return false;
  });
}
