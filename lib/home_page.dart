import 'package:ed_project/add_task_bar.dart';
import 'package:ed_project/theme.dart';
import 'package:ed_project/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDay = DateTime.now();
  CalendarFormat format = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TableCalendar(
              focusedDay: focusedDay,
              firstDay: DateTime(2010),
              lastDay: DateTime(2048),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.monday,
              daysOfWeekVisible: true,
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
              },
              calendarStyle: CalendarStyle(
                defaultTextStyle: const TextStyle(color: Colors.white),
                weekendTextStyle: const TextStyle(color: Colors.white),
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: PrimaryClr,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: const TextStyle(color: Colors.white),
                todayDecoration: const BoxDecoration(
                  color: Color.fromARGB(255, 90, 137, 171),
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: HeaderStyle(
                titleTextStyle: const TextStyle(color: Colors.white),
                formatButtonVisible: false,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: PrimaryClr,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: const TextStyle(color: Colors.white),
              ),
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
            ),
          )
        ],
      ),
    );
  }
}

_addTaskBar() {
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                'Today',
                style: headingStyle,
              )
            ],
          ),
        ),
        MyButton(
          label: "+ Add Task",
          onTap: () => Get.to(() => AddTaskPage()),
        ),
      ],
    ),
  );
}

_appBar() {
  return AppBar(
    elevation: 0,
    title: const Text('Calendar'),
    centerTitle: true,
    titleTextStyle: GoogleFonts.lato(),
  );
}
