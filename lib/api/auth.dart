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

Future<bool> register(Map userData) async {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  String? managerEmail;

  try {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userData["email"], password: userData["password"]);

    userData.remove("password");
    managerEmail = userData.remove("manager_email");

    users
      .doc(credential.user?.uid)
      .set(userData, SetOptions(merge: true))
      .then((value) => print("User added"));

    if (!userData["manager"]) {
      users
        .where('email', isEqualTo: managerEmail)
        .limit(1)
        .get()
        // this will return a QuerySnapshot
        .then((snapshot) {
          final String managerDocID;
          // get manager id from snapshot
          // no need to check for existence because it's checked before
          // the call to the register function
          managerDocID = snapshot.docs[0].id;
          users
            .doc(managerDocID)
            .collection("Employees")
            .doc(credential.user?.uid)
            .set(
              {"ref": users.doc(credential.user?.uid)},
              SetOptions(merge: true)
            );
      });
    }

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
