import 'package:ed_project/add_task_bar.dart';
import 'package:ed_project/task_tile.dart';
import 'package:ed_project/theme.dart';
import 'package:ed_project/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ed_project/controllers/task_controller.dart';
import 'package:ed_project/db/db_helper.dart';
import 'package:ed_project/models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDay = DateTime.now();
  final _taskController = Get.put(TaskController());
  var notifyHelper;
  CalendarFormat format = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  int currentIndex = 0;
  final screens = [
    AddTaskPage(),
    Center(
      child: Text(
        'Settings',
        style: subHeadingStyle,
      ),
    ),
    TableCalendar
  ];

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
          ),
          SizedBox(
            height: 10,
          ),
          _showTasks(),
        ],
      ),
    );
  }

  _showTasks() {
    return Expanded(child: Obx((() {
      return ListView.builder(
          itemCount: _taskController.taskList.length,
          itemBuilder: ((_, index) {
            return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                    child: FadeInAnimation(
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            _showBottomSheet(
                                context, _taskController.taskList[index]);
                          },
                          child: TaskTile(_taskController.taskList[index]))
                    ],
                  ),
                )));
          }));
    })));
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: task.isCompleted == 1
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.32,
        color: Get.isDarkMode ? Colors.blueGrey : Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300]),
            ),
            Spacer(),
            task.isCompleted == 1
                ? Container()
                : _bottomSheetButton(
                    label: "Task Completed",
                    onTap: () {
                      _taskController.markTaskCompleted(task.id!);
                      _taskController.getTasks();
                      Get.back();
                    },
                    clr: PrimaryClr,
                    context: context,
                  ),
            _bottomSheetButton(
              label: "Delete Task",
              onTap: () {
                _taskController.delete(task);

                Get.back();
              },
              clr: Colors.red[300]!,
              context: context,
            ),
            SizedBox(
              height: 20,
            ),
            _bottomSheetButton(
              label: "Close",
              onTap: () {
                Get.back();
              },
              clr: Colors.red[300]!,
              isClose: true,
              context: context,
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose == true
                ? Get.isDarkMode
                    ? Colors.grey[600]!
                    : Colors.grey[300]!
                : clr,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(label,
              style: isClose
                  ? titleStyle
                  : titleStyle.copyWith(color: Colors.white)),
        ),
      ),
    );
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
            onTap: () async {
              await Get.to(() => AddTaskPage());
              _taskController.getTasks();
            },
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
      titleTextStyle: GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Get.isDarkMode ? Colors.grey[100] : Colors.white),
      ),
    );
  }
}
