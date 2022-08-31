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
                    headerDateFormat: 'MMMM y',
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
          "https://script.google.com/macros/s/AKfycbwsCnMZa1hF9Y2vTuwc1gXpl9ycQ0kQgyOVxbDzkia3JczZMtM5BNnyo9PMy_MBEiVF/exec"),
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
        recurrenceRule: 'FREQ=DAILY;INTERVAL=7;BYDAY:$recurrence;COUNT=10',
      );
      appointmentData.add(meetingData);
    }
    return appointmentData;
  }

  DateTime _convertDateFromString(String date) {
    return DateTime.parse(date);
  }

  void calendarTapped(CalendarTapDetails details) {
    final Appointment meeting = details.appointments![0];
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(meeting.subject, 
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w800,
                  fontSize: 25, ),),
            content: Text(meeting.startTime.toString(), ),

            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cerrar', 
                    style: GoogleFonts.roboto(
                      fontSize:  18,
                      color: Colors.blue.shade500,
                      fontWeight: FontWeight.w600, 
                  ),))
            ],
          );
        });
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  String getRecurrenceRule(int index) {
    return appointments![index].recurrenceRule;
  }
}

class Meeting {
  Meeting({
    this.eventName = '',
    required this.from,
    required this.to,
    this.recurrenceRule,
    this.background,
    this.isAllDay = false,
  });

  String? eventName;
  DateTime? from;
  DateTime? to;
  String? recurrenceRule;
  Color? background; 
  bool? isAllDay;
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: GoogleSheetData(),
      );
}

// class MyCalendar extends StatefulWidget {
//   const MyCalendar({Key? key}) : super(key: key);

//   @override
//   State<MyCalendar> createState() => _MyCalendarState();
// }

// class _MyCalendarState extends State<MyCalendar> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//       child: Scaffold(
//         backgroundColor: Colors.blue.shade100,
//         body: Center(
//           child: Container(
//             width: 50,
//             height: 50,
//             decoration: BoxDecoration(
//               color: Colors.amber.shade300,
//               borderRadius: BorderRadius.circular(10)
//             ),
//           ),
//         ),
//         ),
//     );
//   }
// }