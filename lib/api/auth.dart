import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> register(Map<String, dynamic> userData) async {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");

  try {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userData["email"], password: userData["password"]);

    userData.remove("password");

    users
        .doc(credential.user?.uid)
        .set(userData, SetOptions(merge: true))
        .then((value) => print("User added"));

    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> updateInfo(String password) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) await user.updatePassword(password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

// use somente quando sabe que o usuário está logado
Future<bool> updateUserData(Map<String, dynamic> userData) async {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  String? managerEmail = userData.remove("manager_email");

  try {
    User? user = FirebaseAuth.instance.currentUser;
    users
        .doc(user?.uid)
        .set(userData, SetOptions(merge: true))
        .then((value) => print("User updated"));

    if (!userData["manager"]) {
      users.where('email', isEqualTo: managerEmail).limit(1).get()
          // this will return a QuerySnapshot
          .then((snapshot) {
        // get manager id from snapshot
        // no need to check for existence because it's checked before
        // the call to the register function
        final String managerDocID = snapshot.docs[0].id;
        users
            .doc(managerDocID)
            .collection("Employees")
            .doc(user?.uid)
            .set({"ref": users.doc(user?.uid)}, SetOptions(merge: true)).then(
                (value) => print("User reference added"));
      });
      CollectionReference metrics =
          FirebaseFirestore.instance.collection("Metrics");
      metrics.doc(user?.uid).set({"email": user?.email});
    }

    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> submitForms(String email, String question1, String question2,
    String question3, String question4, String question5) async {
  try {
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
