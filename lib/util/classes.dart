import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'calendar_sf.dart';

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

  @override
  String getNotes(int index) {
    return appointments![index].notes;
  }

  @override
  String getLocation(int index) {
    return appointments![index].location;
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
    this.notes = '',
    this.location = '',
  });

  String? eventName;
  DateTime? from;
  DateTime? to;
  String? recurrenceRule;
  Color? background;
  bool? isAllDay;
  String? notes;
  String? location;
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: GoogleSheetData(),
      );
}
