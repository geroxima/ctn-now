// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../util/calendar_sf.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(height: 50,), 

          //search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 9, 
                    offset: Offset(0, 8),
                  )
                ]
              ),
              child: TextField(
                //accion del textfield

                //decoracion del textfield
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Buscar...',
                  hintStyle: GoogleFonts.roboto(
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade600,
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Image.asset('lib/icons/search.png',height: 20, color: Colors.grey[600],),
                  )
                ),   
              ),
            ),
          ),
          SizedBox(height: 15,),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              child: Text(
                'Tu horario',
                style: GoogleFonts.roboto(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                 ),
            ),
          ),


          SizedBox(height: 10,),
          //horarios/calendario
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.amber.shade100,
                    child: Home()),
                ),
              ],
            ),
          ),
          
        ],
      ),

    );
    
  }
}

