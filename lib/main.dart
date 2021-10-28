import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:omni_manager/pages/Home.dart';
import 'package:omni_manager/pages/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils/constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(App());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          //return SomethingWentWrong();
          // TODO: widget de erro
          print("erro");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print('firebase init');
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        // TODO: criar widget de loading
        // return Loading();
        return Container(
          height: double.infinity,
          width: double.infinity,
          color: Color.fromRGBO(34, 36, 49, 1),
          alignment: Alignment.bottomCenter,
        );
      },
    );
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
      },
    );
  }
}
