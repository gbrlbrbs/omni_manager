import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:omni_manager/api/auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _users = _firestore.collection('Users');
final CollectionReference _metrics = _firestore.collection('Metrics');

class Database {
  static String? userUid = getUserUid();

  static Future<bool> validateManager(Map<String, String> managerData) async {
    // flow: vai encontrar o doc com email, determinar se existe e retornar um bool
    return _users
        .where("email", isEqualTo: managerData["email"])
        .where("company", isEqualTo: managerData["company"])
        .where("department", isEqualTo: managerData["department"])
        .limit(1)
        .get()
        .then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        return true;
      }
      return false;
    });
  }

  static Future<QuerySnapshot> listRatings() {
    return _metrics.doc(userUid).collection('Formularies').get();
  }

  static Future<QuerySnapshot> listEmployees() {
    return _users.doc(userUid).collection('Employees').get();
  }

  static Future<DocumentSnapshot> getEmployeeData(
      DocumentSnapshot employee) async {
    return employee.get(FieldPath(['user'])).get();
  }

  static Future<DocumentReference> addForm(
      String? employee, bool isManager) async {
    return _metrics.doc(employee).collection('Formularies').add({
      'release_date': Timestamp.fromDate(DateTime.now()),
      'filled': false,
      'manager': isManager,
    });
  }

  static Future<DocumentSnapshot>? getForm(String? employee, bool isManager) {}

  static void releaseForms() {
    final CollectionReference employees =
        _users.doc(userUid).collection('Employees');
    print('>>releaseForms()');
    employees
        .get()
        .then((QuerySnapshot emp) => {
              emp.docs.forEach((element) async {
                final DocumentSnapshot user =
                    await element.get(FieldPath(['user'])).get();
                print(
                    "${user.id} \n employee: ${user.get(FieldPath(['name']))}");
                await Future.wait([
                  addForm(user.id, false),
                  addForm(user.id, true)
                ])
                    .then((value) => print('both forms added'))
                    .catchError((error) => print('some error occurred..'));
              })
            })
        .catchError((error) => print('error while fetching employees'));
  }

  static void fillForms() {}
}

// example
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
