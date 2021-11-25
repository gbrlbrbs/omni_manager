//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:omni_manager/api/queries.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //CollectionReference users = FirebaseFirestore.instance.collection("Users");
    User user = FirebaseAuth.instance.currentUser as User;

    return GetUserName(user.uid);
  }
}
