import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

CollectionReference users = FirebaseFirestore.instance.collection("Users");
bool loggedUserIsManager = false;

Future<bool> signIn(String email, String password) async {
  try {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    loggedUserIsManager = false;
    final snapshot = await users.doc(credential.user?.uid).get();
    if (snapshot.exists) {
      Map data = snapshot.data() as Map;
      loggedUserIsManager = data["manager"] ?? false;
    }

    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> register(Map userData) async {
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
