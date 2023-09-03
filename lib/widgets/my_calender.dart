// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// class MyCalendar extends StatefulWidget {
//   @override
//   _MyCalendarState createState() => _MyCalendarState();
// }
//
// class _MyCalendarState extends State<MyCalendar> {
//   CalendarController _controller;
//   Map<DateTime, List<dynamic>> _events;
//   DateTime _selectedDay;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = CalendarController();
//     _selectedDay = DateTime.now();
//     _events = {};
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar(
//       calendarController: _controller,
//       events: _events,
//       initialCalendarFormat: CalendarFormat.month,
//       startingDayOfWeek: StartingDayOfWeek.sunday,
//       calendarStyle: CalendarStyle(
//         todayColor: Colors.blue,
//         selectedColor: Colors.green,
//         weekendStyle: TextStyle(color: Colors.red),
//         outsideDaysVisible: false,
//       ),
//       headerStyle: HeaderStyle(
//         formatButtonVisible: false,
//         centerHeaderTitle: true,
//         formatButtonShowsNext: false,
//       ),
//       onDaySelected: (date, events) {
//         setState(() {
//           _selectedDay = date;
//         });
//       },
//       builders: CalendarBuilders(
//         selectedDayBuilder: (context, date, events) =>
//             Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: Colors.green,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Text(
//                 date.day.toString(),
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//         todayDayBuilder: (context, date, events) =>
//             Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Text(
//                 date.day.toString(),
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//       ), focusedDay: null, firstDay: null,
//     );
//   }
// }
