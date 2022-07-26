import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/screens/settings_screens/main_settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text("Más opciones",
            style: GoogleFonts.roboto(
              fontSize: 30,
              fontWeight: FontWeight.bold,),
            ),
          ),
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ElevatedButton.icon(
              icon: const Icon(
                CupertinoIcons.slider_horizontal_3,
                color: Colors.black,),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                shadowColor: Colors.transparent,
                primary: Colors.transparent,
              ),
              label: Text('Configuración',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              ),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>const MainSettings()),
                  );
              },          
              ),
          )

        ],
      ),
    );
  }
}