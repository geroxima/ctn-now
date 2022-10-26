import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void calendarTapped(CalendarTapDetails details) {
  final Appointment meeting = details.appointments![0];
  var context;
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              meeting.subject,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w800,
                fontSize: 25,
              ),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              height: 120,
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      "inicia: ",
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                    Text(meeting.startTime.hour.toString()),
                    Text(":"),
                    Text(meeting.startTime.minute.toString()),
                    Text(" hs."),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "termina: ",
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                    Text(meeting.endTime.hour.toString()),
                    Text(":"),
                    Text(meeting.endTime.minute.toString()),
                    Text(" hs."),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "horas cátedras: ",
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                    Text(meeting.location.toString()),
                    Text("."),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "docente: ",
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                    Text(meeting.notes.toString()),
                  ],
                ),
              ]),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue.shade50,
                ),
                child: Text(
                  'Cerrar',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: Colors.blue.shade500,
                    fontWeight: FontWeight.w600,
                  ),
                ))
          ],
        );
      });
}
