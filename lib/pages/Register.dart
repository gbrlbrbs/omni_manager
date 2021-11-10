import 'package:flutter/material.dart';
import 'package:omni_manager/pages/Home.dart';
import 'package:omni_manager/pages/Login.dart';
import 'package:omni_manager/utils/constants.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = "/register";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _repeatpasswordController = TextEditingController();

  final _departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Staff Register Page"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              controller: _nameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "Your name", labelText: "Name"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _usernameController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintText: "Enter e-mail",
                                  labelText: "Username"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your e-mail';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Enter password",
                                  labelText: "Password"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _repeatpasswordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Confirm password",
                                  labelText: "Repeat Password"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != _passwordController.text) {
                                  return 'Unmatched passwords! Try typing again.';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _departmentController,
                              keyboardType: TextInputType.text,
                              validator: (s) {},
                              decoration: InputDecoration(
                                  hintText: "Enter the department you work at",
                                  labelText: "Department"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  // Send Data to the DB here

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Loading...')),
                                  );
                                  Constants.prefs.setBool("loggedIn", true);
                                  Navigator.pushReplacementNamed(
                                      context, HomePage.routeName);
                                }
                              },
                              child: Text("Register"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, LoginPage.routeName);
                              },
                              child: Text("Sign In"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
