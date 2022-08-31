import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 254, 255, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Text('Acerca de', 
          style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.bold, 
              fontSize: 25,)   
              ),
        iconTheme: const IconThemeData(
            color: Colors.black, 
            size: 30),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: const [
                Image(
                    image: AssetImage('lib/icons/ctn_now.png'),
                    width: 100,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image(
                    image: AssetImage('lib/icons/ctn-logo.png'),
                      width: 80,
                    ),
                ),
                Image(
                  image: AssetImage('lib/icons/expocientec_logo.jpg'),
                    width: 100,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('"Diseño y Desarrollo de una aplicación móvil para uso del alumnado del Colegio Técnico Nacional" \n\nCTN now es una aplicación diseñada para el uso de los alumnos del Colegio Técnico Nacional.\nProyecto de fin de curso del Bachillerato Técnico en Informática. Proyecto competitivo en la Expocientec. \nEsta versión de la app está en proceso de Beta Testing. \nProyecto Open Source. \n\nProyecto desarrollado con Flutter SDK. \nDesarollado durante el perdiodo de abril a agosto del 2022. \n\nAdán Alvarez \nFabriccio Bogdanoff \nChristopher Mendoza',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              )),
              ),
          const SizedBox(height: 25),
          
        ],
      ),
    );
  }
}