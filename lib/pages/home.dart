import 'package:flutter/material.dart';
import 'package:omni_manager/api/auth.dart';
import 'package:omni_manager/pages/dashboard/dashboard.dart';
import 'package:omni_manager/pages/forms/forms.dart';
import 'package:omni_manager/pages/login.dart';
import 'package:omni_manager/pages/settings/settings.dart';
import 'package:omni_manager/pages/spreadsheet/spreadsheet.dart';
import 'package:omni_manager/pages/sidebar/sidebar.dart';
import 'package:omni_manager/utils/constants.dart';
// import '../api/firebase.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool loaded = false;

  Future<void> loadIsManager() async {
    loggedUserIsManager = await isUserManager(getUserUid());
  }

  @override
  void initState() {
    super.initState();
    loaded = false;
    loadIsManager().then((value) => setState(() {
          loaded = true;
        }));
  }

  void callback(int index) {
    setState(() {
      this._selectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Omni Manager"),
          ),
          body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Omni Manager"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
          )
        ],
      ),
      body: Row(
        children: [
          Sidebar(selectedIndex: _selectedIndex, loggedUserIsManager: loggedUserIsManager, callback: this.callback),
          const VerticalDivider(
            width: 1,
          ),
          _pageAtIndex(_selectedIndex)
        ],
      ),
    );
  }
}

Widget _pageAtIndex(int index) {
  if (loggedUserIsManager) {
    switch (index) {
      case 0:
        return DashboardPage();
      case 1:
        return SpreadsheetPage();
      case 2:
        return FormsPage();
      case 3:
        return SettingsPage();
    }
  } else {
    switch (index) {
      case 0:
        return FormsPage();
      case 1:
        return SettingsPage();
    }
  }

  return const Center(
    child: Text('Oops'),
  );
}
