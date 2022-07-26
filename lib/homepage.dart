// ignore_for_file: prefer_const_constructors, prefer_final_fields
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:test/screens/home.dart';
import 'package:test/screens/map.dart';
import 'package:test/screens/notifications.dart';
import 'package:test/screens/settings.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> { 
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MapScreen(),
    NotificationsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
          spreadRadius: 4,
          blurRadius: 9,
          offset: Offset(0, 3) )]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
            ),
          child: GNav(
            duration: Duration(milliseconds: 350),
            gap: 8,
            backgroundColor: Colors.grey.shade300,
            color: Colors.black,
            hoverColor: Colors.grey.shade300,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.black,
            padding: EdgeInsets.all(15),
            tabs: const [
              GButton(
                icon: CupertinoIcons.house_fill,
                text: 'Inicio',
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                ),
              GButton(
                icon: CupertinoIcons.map_fill,
                text: 'Mapa',
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                ),
              GButton(
                icon: CupertinoIcons.bell_fill,
                text: 'Notificaciones',
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                ),
              GButton(
                icon: Icons.more_horiz,
                text: 'Más',
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                ),
            ],
            selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
          ),
        ),
      ),
    );
    
  }
}