import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:omni_manager/api/auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _userCollection = _firestore.collection('Users');
final CollectionReference _metricsCollection = _firestore.collection('Metrics');

class Database {
  static String? userUid = getUserUid();

  static Future<bool> validateManager(Map<String, String> managerData) async {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  // flow: vai encontrar o doc com email, determinar se existe e retornar um bool
  return users
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

  static Stream<QuerySnapshot> listRatings() {
    return _metricsCollection
        .doc(userUid)
        .collection('Formularies')
        .snapshots();
  }

  static Stream<QuerySnapshot> listEmployees() {
    return _userCollection.doc(userUid).collection('Employees').snapshots();
  }

  static Future<DocumentSnapshot> getEmployeeData(
      DocumentSnapshot employee) async {
    return employee.get(FieldPath(['user'])).get();
  }

  static Future<DocumentReference> addFormForEmployee(String? employee) async {
    return _metricsCollection.doc(employee).collection('Formularies').add({
      'release_date': Timestamp.fromDate(DateTime.now()),
      'filled': false,
      'manager': false,
    });
  }

  static Future<DocumentReference> addFormForManager(String? employee) async {
    return _metricsCollection.doc(employee).collection('Formularies').add({
      'release_date': Timestamp.fromDate(DateTime.now()),
      'filled': false,
      'manager': true,
    });
  }

  static void releaseForms() {
    final CollectionReference employees =
        _userCollection.doc(userUid).collection('Employees');
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
                  addFormForEmployee(user.id),
                  addFormForManager(user.id)
                ])
                    .then((value) => print('both forms added'))
                    .catchError((error) => print('some error occurred..'));
              })
            })
        .catchError((error) => print('error while fetching employees'));
  }
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
