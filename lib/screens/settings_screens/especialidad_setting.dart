// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/screens/settings_screens/preferences_sevices.dart';
import 'package:test/util/models.dart';

class EspecialiddadScreen extends StatefulWidget {
  const EspecialiddadScreen({Key? key}) : super(key: key);

  @override
  State<EspecialiddadScreen> createState() => EspecialiddadScreenState();
}

class EspecialiddadScreenState extends State<EspecialiddadScreen> {
  final _preferencesService = PreferenceService();
  var _selectEspecialidad = Especialidad.INFORMATICA;
  var _selectCurso = Curso.PRIMERO;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final settings = await _preferencesService.getSettings();
    setState(() {
      _selectEspecialidad = settings.especialidad;
      _selectCurso = settings.curso;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Curso & Especialidad",
          style: GoogleFonts.roboto(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const Icon(CupertinoIcons.arrow_left, 
          color: Colors.black, 
          size: 35),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView(
          children: [
            RadioListTile<Especialidad>(
                title: Text(
                  "Informática",
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: Especialidad.INFORMATICA,
                groupValue: _selectEspecialidad,
                onChanged: (newValue) {
                  setState(() {
                    _selectEspecialidad = newValue!;
                  });
                }),
            RadioListTile<Especialidad>(
                title: Text(
                  "Electromecánica",
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: Especialidad.ELECTROMECANICA,
                groupValue: _selectEspecialidad,
                onChanged: (newValue) {
                  setState(() {
                    _selectEspecialidad = newValue!;
                  });
                }),
            RadioListTile<Especialidad>(
                title: Text(
                  "Mecatrónica",
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: Especialidad.MECATRONICA,
                groupValue: _selectEspecialidad,
                onChanged: (newValue) {
                  setState(() {
                    _selectEspecialidad = newValue!;
                  });
                }),
            RadioListTile<Especialidad>(
                title: Text(
                  "Química",
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: Especialidad.QUIMICA,
                groupValue: _selectEspecialidad,
                onChanged: (newValue) {
                  setState(() {
                    _selectEspecialidad = newValue!;
                  });
                }),
            RadioListTile<Especialidad>(
                title: Text(
                  "Automotriz",
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: Especialidad.MECANICA_AUTOMOTRIZ,
                groupValue: _selectEspecialidad,
                onChanged: (newValue) {
                  setState(() {
                    _selectEspecialidad = newValue!;
                  });
                }),
            RadioListTile<Especialidad>(
                title: Text(
                  "Electricidad",
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: Especialidad.ELECTRICIDAD,
                groupValue: _selectEspecialidad,
                onChanged: (newValue) {
                  setState(() {
                    _selectEspecialidad = newValue!;
                  });
                }),
            RadioListTile<Especialidad>(
                title: Text(
                  "Electrónica",
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: Especialidad.ELECTRONICA,
                groupValue: _selectEspecialidad,
                onChanged: (newValue) {
                  setState(() {
                    _selectEspecialidad = newValue!;
                  });
                }),
            RadioListTile<Especialidad>(
                title: Text(
                  "Construcciones Civiles",
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: Especialidad.CONSTRUCCIONES_CIVILES,
                groupValue: _selectEspecialidad,
                onChanged: (newValue) {
                  setState(() {
                    _selectEspecialidad = newValue!;
                  });
                }),
            Divider(
              height: 50,
              thickness: 1,
              color: Colors.grey.shade300,
              indent: 25,
              endIndent: 25,
            ),
            RadioListTile<Curso>(
                title: Text(
                  "1ero",
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: Curso.PRIMERO,
                groupValue: _selectCurso,
                onChanged: (newValue) {
                  setState(() {
                    _selectCurso = newValue!;
                  });
                }),
            RadioListTile<Curso>(
                title: Text(
                  "2ndo",
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: Curso.SEGUNDO,
                groupValue: _selectCurso,
                onChanged: (newValue) {
                  setState(() {
                    _selectCurso = newValue!;
                  });
                }),
            RadioListTile<Curso>(
                title: Text(
                  "3ero",
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: Curso.TERCERO,
                groupValue: _selectCurso,
                onChanged: (newValue) {
                  setState(() {
                    _selectCurso = newValue!;
                  });
                }),
            TextButton(
                onPressed: _saveSettings,
                child: Text("Guardar cambios",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade400,
                    )))
          ],
        ),
      ),
    );
  }

  void _saveSettings() {
    final newSettings =
        Settings(especialidad: _selectEspecialidad, curso: _selectCurso);

    print(newSettings);
    _preferencesService.saveSettings(newSettings);
    print(_selectEspecialidad);
    print(_selectCurso);
  }
}
