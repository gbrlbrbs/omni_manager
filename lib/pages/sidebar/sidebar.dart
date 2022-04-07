import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Sidebar extends StatefulWidget {
  Sidebar({ Key? key, required this.selectedIndex, required this.loggedUserIsManager, required this.callback}) : super(key: key);

  Function callback;
  int selectedIndex;
  bool loggedUserIsManager;

  @override
  State<Sidebar> createState() => _SidebarState(selectedIndex, loggedUserIsManager);
}

class _SidebarState extends State<Sidebar> {
  _SidebarState(this.selectedIndex, this.loggedUserIsManager);
  int selectedIndex;
  bool loggedUserIsManager;
  

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          this.widget.callback(index);
          selectedIndex = index;
        });
      },
      labelType: NavigationRailLabelType.selected,
      destinations: [
        if (loggedUserIsManager)
          NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              label: Text("Home"),
              selectedIcon: Icon(Icons.home)),
        if (loggedUserIsManager)
          NavigationRailDestination(
              icon: Icon(Icons.list_outlined),
              label: Text("List"),
              selectedIcon: Icon(Icons.list)),
        NavigationRailDestination(
            icon: Icon(Icons.forum_outlined),
            label: Text("Forms"),
            selectedIcon: Icon(Icons.forum)),
        NavigationRailDestination(
            icon: Icon(Icons.settings_outlined),
            label: Text("Settings"),
            selectedIcon: Icon(Icons.settings)),
      ],
    );
  }
}