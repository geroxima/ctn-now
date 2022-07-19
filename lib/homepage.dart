// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:test/screens/home.dart';
import 'package:test/screens/map.dart';
import 'package:test/screens/notifications.dart';
import 'package:test/screens/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> { 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 4,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),

          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
            ),
          child: GNav(
            gap: 8,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Inicio',
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                ),
              GButton(
                icon: Icons.map,
                text: 'Mapa',
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                ),
              GButton(
                icon: Icons.notifications,
                text: 'Notificaciones',
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                ),
              GButton(
                icon: Icons.settings,
                text: 'Configuración',
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                ),
            ],
          ),
        ),
      ),
    );
    
  }
}