import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  static Future<List<Map<String, dynamic>>> listEmployeesWithData() {
    return listEmployees().then((snapshot) async {
      List<Map<String, dynamic>> employees = [];
      for (var doc in snapshot.docs) {
        final snap = await doc.get(FieldPath(['ref'])).get();
        employees.add(snap.data());
      }
      return employees;
    }).catchError((err) {
      print("Fail: $err");
      return [] as List<Map<String, dynamic>>;
    });
  }

  static Future<DocumentSnapshot> getEmployeeData(
      DocumentSnapshot employee) {
    return employee.get(FieldPath(['ref'])).get();
  }

  static Future<DocumentReference> addForm(
      String? employee, bool isManager) async {
    return _metrics.doc(employee).collection('Formularies').add({
      'release_date': Timestamp.fromDate(DateTime.now()),
      'is_filled': false,
      'is_manager': isManager,
    });
  }

  static Future<QuerySnapshot> getUnfilledForm(
      {required bool isManager, String? employee}) {
    var docId = isManager ? employee : userUid;
    print(docId);
    return _metrics
        .doc(docId)
        .collection('Formularies')
        .where('is_manager', isEqualTo: isManager)
        .where('is_filled', isEqualTo: false)
        .where('release_date',
            isGreaterThanOrEqualTo: Timestamp.fromDate(
                DateTime.now().subtract(const Duration(days: 7))))
        .limit(1)
        .get();
  }

  static Future<QuerySnapshot> getEmployeeForms(String empID) async {
    return _metrics
        .doc(empID)
        .collection("Formularies")
        .where('is_filled', isEqualTo: true)
        .get();
  }

  static Future<QuerySnapshot> getEmployeeFormsLast7Days(String empID) {
    return _metrics
        .doc(empID)
        .collection("Formularies")
        .where('is_filled', isEqualTo: true)
        .where('release_date',
            isGreaterThanOrEqualTo: Timestamp.fromDate(
                DateTime.now().subtract(const Duration(days: 7))))
        .get();
  }

  static Future<void> releaseForms() {
    final CollectionReference employees =
        _users.doc(userUid).collection('Employees');
    return employees
        .get()
        .then((QuerySnapshot emp) => {
              emp.docs.forEach((element) async {
                final DocumentSnapshot user =
                    await element.get(FieldPath(['ref'])).get();
                print(
                    "${user.id} \n employee: ${user.get(FieldPath(['name']))}");
                await Future.wait(
                        [addForm(user.id, false), addForm(user.id, true)])
                    .then((value) => print('both forms added'))
                    .catchError((error) => print('some error occurred..'));
              })
            })
        .catchError((error) => print('error while fetching employees'));
  }

  static Future<void> fillForms(
      {required bool isManager,
      String? employee,
      int load: 0,
      int completion: 0,
      double quality: 0,
      double proactivity: 0}) {
    var docId = isManager ? employee : userUid;
    return _metrics
        .doc(docId)
        .collection('Formularies')
        .where('is_manager', isEqualTo: isManager)
        .where('is_filled', isEqualTo: false)
        .limit(1)
        .get()
        .then((snapshot) => snapshot.docs[0].reference.update({
              'work_load': load,
              'work_completion': completion,
              'work_quality': quality,
              'work_proactivity': proactivity,
              'is_filled': true,
              'submission_date': Timestamp.now()
            }))
        .catchError((err) => print('Fail: $err'));
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
