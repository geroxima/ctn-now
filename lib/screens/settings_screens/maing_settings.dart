import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/screens/settings.dart';

class MainSettings extends StatefulWidget {
  const MainSettings({Key? key}) : super(key: key);

  @override
  State<MainSettings> createState() => _MainSettingsState();
}

class _MainSettingsState extends State<MainSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración', 
        style: GoogleFonts.roboto(
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.bold,),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          size: 30,
          color: Colors.black
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(height: 50,)
          
        ],
      ),
    );
  }
}