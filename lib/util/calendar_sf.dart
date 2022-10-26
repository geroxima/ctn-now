import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'dart:convert' as convert;
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:test/util/widgets/alertDialog.dart';

import 'classes.dart';

class GoogleSheetData extends StatefulWidget {
  const GoogleSheetData({Key? key}) : super(key: key);

  @override
  LoadDataFromGoogleSheetState createState() => LoadDataFromGoogleSheetState();
}

class LoadDataFromGoogleSheetState extends State<GoogleSheetData> {
  MeetingDataSource? events;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Seleccion de idioma para el calendario
      localizationsDelegates: const [SfGlobalLocalizations.delegate],
      supportedLocales: const [
        Locale('es'),
      ],
      locale: const Locale('es'),
      debugShowCheckedModeBanner: false,

      home: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: FutureBuilder(
            future: getDataFromGoogleSheet(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: SfCalendar(
                    view: CalendarView.schedule,
                    allowViewNavigation: true,
                    showDatePickerButton: true,
                    viewNavigationMode: ViewNavigationMode.snap,
                    initialSelectedDate: DateTime.now(),
                    timeSlotViewSettings: const TimeSlotViewSettings(
                      startHour: 7,
                      endHour: 19,
                    ),
                    headerDateFormat: 'MMMM',
                    onTap: calendarTapped,
                    headerStyle: CalendarHeaderStyle(
                        textAlign: TextAlign.left,
                        textStyle: GoogleFonts.roboto(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey.shade400,
                        )),
                    allowedViews: const [
                      CalendarView.schedule,
                      CalendarView.day,
                      CalendarView.month
                    ],
                    appointmentTimeTextFormat: 'H:mm a',
                    todayHighlightColor: Colors.blue.shade500,
                    scheduleViewSettings: ScheduleViewSettings(
                        dayHeaderSettings: DayHeaderSettings(
                            dayTextStyle: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600,
                            ),
                            dateTextStyle: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600,
                            )),
                        appointmentItemHeight: 70,
                        hideEmptyScheduleWeek: true,
                        monthHeaderSettings: const MonthHeaderSettings(
                          height: 0,
                        )),
                    dataSource: MeetingDataSource(snapshot.data),
                  ),
                );
              } else {
                return Center(
                    child: Lottie.asset('lib/anim/51941-offline.json'));
              }
            },
          )),
    );
  }

  Future<List<Meeting>> getDataFromGoogleSheet() async {
    Response data = await http.get(
      Uri.parse(
          "https://script.google.com/macros/s/AKfycbxfrK6rGf1LXavZqugNOlxooRcOLpRmiFcsbhLlOBHi1oKr7p0BooQR5-HOXnGTT3DBIA/exec"),
    );
    dynamic jsonAppData = convert.jsonDecode(data.body);

    final List<Meeting> appointmentData = [];

    for (dynamic data in jsonAppData) {
      var recurrence = data['byday'];
      Meeting meetingData = Meeting(
        eventName: data['subject'],
        from: _convertDateFromString(data['starttime']),
        to: _convertDateFromString(data['endtime']),
        background: Colors.grey.shade800,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=7;BYDAY:$recurrence;COUNT=30',
        notes: data['notes'],
        location: data['lecturetime'],
      );
      appointmentData.add(meetingData);
    }
    return appointmentData;
  }

  DateTime _convertDateFromString(String date) {
    return DateTime.parse(date);
  }
}
