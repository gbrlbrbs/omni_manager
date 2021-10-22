import 'package:flutter/material.dart';
import 'package:omni_manager/pages/Home.dart';
import 'package:omni_manager/pages/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils/constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

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