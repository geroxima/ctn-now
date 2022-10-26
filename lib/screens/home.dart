// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../util/classes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SafeArea(
            child: Row(children: const [
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Image(
                  image: AssetImage('lib/icons/ctn_now.png'),
                  width: 150,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Image(
                  image: AssetImage('lib/icons/ctn-logo.png'),
                  width: 90,
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Tu horario',
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          //horarios/calendario
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(color: Colors.amber.shade100, child: Home()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
