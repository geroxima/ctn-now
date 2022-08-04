//En este archivo se integran los modelos de datos
//Especialidades
// ignore_for_file: constant_identifier_names

import 'package:localization/colored_print/print_color.dart';

enum Especialidad {
  INFORMATICA,
  ELECTROMECANICA,
  MECATRONICA,
  QUIMICA,
  MECANICA_AUTOMOTRIZ,
  ELECTRICIDAD,
  ELECTRONICA,
  CONSTRUCCIONES_CIVILES,
}

//Cursos
enum Curso { PRIMERO, SEGUNDO, TERCERO }

//Sección
enum Seccion { PRIMERA, SEGUNDA }

//Clase que guarda la información
class Settings {
  final Especialidad especialidad;
  final Curso curso;

  Settings({
    required this.especialidad,
    required this.curso,
  });
}
