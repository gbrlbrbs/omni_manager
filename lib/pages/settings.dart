import 'package:flutter/material.dart';
import 'package:omni_manager/pages/home.dart';
import 'package:omni_manager/api/auth.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = "/settings";
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _repeatpasswordController = TextEditingController();

  final _departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Update Account Info"),
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
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Enter new password",
                                  labelText: "New Password"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your new password';
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
                                  return 'Please confirm the password';
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
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  bool successfulUpdate = await updateInfo(
                                      _passwordController.text);

                                  if (successfulUpdate) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Loading...')),
                                    );
                                    Navigator.pushReplacementNamed(
                                        context, HomePage.routeName);
                                  }
                                }
                              },
                              child: Text("Update Info"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, HomePage.routeName);
                              },
                              child: Text("Back"),
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
