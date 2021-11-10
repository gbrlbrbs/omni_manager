import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:omni_manager/pages/Home.dart';
import 'package:omni_manager/pages/Login.dart';
import 'package:omni_manager/pages/Register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(255, 36, 49, 1),
        alignment: Alignment.bottomCenter,
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(34, 36, 49, 1),
        alignment: Alignment.bottomCenter,
      );
    }

    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Constants.prefs.getBool("loggedIn") == true
          ? HomePage()
          : LoginPage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.yellow,
      ),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => HomePage(),
        RegisterPage.routeName: (context) => RegisterPage(),
      },
    );
  }
}
