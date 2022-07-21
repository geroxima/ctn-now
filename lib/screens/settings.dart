import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

          SizedBox(height: 50,),

          //////
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              child: Text("Más opciones",
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.bold,),
              ),
            ),
          ),

          SizedBox(height: 25,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400,
              ),
              

              child: TextButton.icon(
                onPressed: (){

                },

                icon: Icon(Icons.settings, size: 18, color: Colors.black,),
                label: Text("Configuración",
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}