import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/util/models.dart';

class PreferenceService {
  Future saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setInt('thisEspecialidad', settings.especialidad.index);
    await preferences.setInt('thisCurso', settings.curso.index);

   print("Saved Settings"); 

  }

 Future <Settings> getSettings() async {
    final preferences = await SharedPreferences.getInstance();

    var especialidad = Especialidad.values[preferences.getInt('thisEspecialidad') ?? 0];
    var curso = Curso.values[preferences.getInt('thisCurso') ?? 0];
    
    return Settings(
      especialidad: especialidad, 
      curso: curso);
  }

}