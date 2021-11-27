import 'package:flutter/material.dart';
import 'package:omni_manager/pages/login.dart';
import 'package:omni_manager/utils/constants.dart';
import 'package:omni_manager/api/auth.dart';
import 'package:omni_manager/api/queries.dart';

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

  final _companyController = TextEditingController();

  final _departmentController = TextEditingController();

  bool _employee = false;

  bool _managerExists = false;

  final _managerEmailController = TextEditingController();

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
                          child: FocusTraversalGroup(
                            policy: WidgetOrderTraversalPolicy(),
                            descendantsAreFocusable: true,
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
                                      hintText: "Your email",
                                      labelText: "Email"),
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
                                  controller: _companyController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your company';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Enter the company you work at",
                                      labelText: "Company"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _departmentController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your department';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText:
                                          "Enter the department you work at",
                                      labelText: "Department"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Employee?"),
                                    Checkbox(
                                        checkColor: Colors.black,
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                (Set<MaterialState> states) {
                                          const Set<MaterialState>
                                              interactiveStates =
                                              <MaterialState>{
                                            MaterialState.pressed,
                                            MaterialState.hovered,
                                            MaterialState.focused,
                                            MaterialState.selected
                                          };
                                          if (states.any(
                                              interactiveStates.contains)) {
                                            return Colors.yellow;
                                          }
                                          return Colors.grey;
                                        }),
                                        value: _employee,
                                        onChanged: (bool? _newValue) => {
                                              setState(() {
                                                _employee = _newValue!;
                                              })
                                            })
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Visibility(
                                    visible: _employee,
                                    child: FocusScope(
                                      child: Focus(
                                        child: TextFormField(
                                          controller: _managerEmailController,
                                          keyboardType: TextInputType.text,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please enter your manager's e-mail";
                                            } else if (!_managerExists) {
                                              return "Manager not found";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              hintText: "Your manager's email",
                                              labelText: "Manager email"),
                                          onFieldSubmitted: (value) async {
                                            bool managerExists =
                                                await validateManager({
                                              "email":
                                                  value,
                                              "company":
                                                  _companyController.text,
                                              "department":
                                                  _departmentController.text
                                            });
                                            print(managerExists);
                                            setState(() {
                                              _managerExists = managerExists;
                                            });
                                          },
                                        ),
                                        canRequestFocus: false,
                                        onFocusChange: (value) => print("focus: $value"),
                                      ),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      bool successfulRegister = await register({
                                        "email": _usernameController.text,
                                        "password": _passwordController.text,
                                        "name": _nameController.text,
                                        "company": _companyController.text,
                                        "department":
                                            _departmentController.text,
                                        "manager": !_employee,
                                        "manager_email":
                                            _managerEmailController.text
                                      });

                                      if (successfulRegister) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('Loading...')),
                                        );
                                        Constants.prefs
                                            .setBool("loggedIn", true);
                                        Navigator.pushReplacementNamed(
                                            context, LoginPage.routeName);
                                      }
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
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
