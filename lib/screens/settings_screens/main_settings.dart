import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/screens/settings.dart';
import 'package:test/screens/settings_screens/especialidad_setting.dart';
import 'package:test/screens/settings_screens/preferences_sevices.dart';

import '../../util/models.dart';

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
          fontSize: 25,
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextButton(
              style: const ButtonStyle(
              ),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>const EspecialiddadScreen()));
              }, 
              child: Text(
                "Curso & especialidad", 
                style: GoogleFonts.roboto(
                  fontSize: 15, 
                  fontWeight: FontWeight.w500)
              )
            ),
          ),
          SizedBox(height: 100,),

          // TextButton(
          //   onPressed: _comprobar, 
          //   child: Text("Comprobar"),)

        ],
      ),
    );
  // }
  // void _comprobar() {
  //  var _selectEspecialidad = ;
  //  final newSettings = Settings(
  //     especialidad: _selectEspecialidad, 
  //     curso: _selectCurso);

  //     print(newSettings);
  //     _preferencesService.saveSettings(newSettings);
  //     print(_selectEspecialidad);
  //     print(_selectCurso);

  }
}