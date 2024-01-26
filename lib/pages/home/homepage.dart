import 'package:flutter/material.dart';
import 'package:visitors2023/helper/helperFunctions.dart';
import 'package:visitors2023/screens/dashboard_screen.dart';
import 'package:visitors2023/screens/settings_screen.dart';
import 'package:visitors2023/screens/visitors_screen.dart';

import '../../widget/utils/dimensions.dart';
import '../devices/homeDesktop.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = [
    HomeDesktop(),
    DashboardScreen(),
    VisitorsScreen(),
    SettingsScreen()
  ];
 
  int _selectedIndex = 0;
  int _lastSelectedIndex = 0;

   String fullName = "";
  String email = "";


  @override
  void initState(){
    super.initState();
    gettingUserData();
  }

  gettingUserData()async{
    await HelperFunction.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFunction.getUserNameFromSF().then((value) {
      setState(() {
        fullName = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Dimensions.screenWidth(context) < 675
          ? BottomNavigationBar(
              currentIndex: _selectedIndex,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.indigoAccent,
              onTap: (value) {
                setState(() {
                  _lastSelectedIndex = _selectedIndex;
                  _selectedIndex = value;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard), label: "Dashboard"),
                BottomNavigationBarItem(icon: Icon(Icons.cabin), label: "Visitors"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Settings"),
              ])
          : null,
      body: Row(
        children: [
          if (Dimensions.screenWidth(context) >= 675) sideBarMethod(),
          Expanded(child: _screens[_selectedIndex]),
        ],
      ),
    );
  }

  NavigationRail sideBarMethod() {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (value) {
        setState(() {
          _lastSelectedIndex = _selectedIndex;
          _selectedIndex = value;
        });
      },
      destinations: [
        NavigationRailDestination(
          icon: Icon(
            Icons.location_pin,
            color: _selectedIndex == 0
                ? Colors.green
                : (_lastSelectedIndex == 0 ? Colors.grey : Colors.black),
          ),
          label: Text(""),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.card_membership,
            color: _selectedIndex == 1 ? Colors.green : Colors.black,
          ),
          label: Text("Dashboard"),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.handshake,
            color: _selectedIndex == 2 ? Colors.green : Colors.black,
          ),
          label: Text("Visitors"),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.settings,
            color: _selectedIndex == 3 ? Colors.green : Colors.black,
          ),
          label: Text("Settings"),
        ),
      ],
    );
  }
}
