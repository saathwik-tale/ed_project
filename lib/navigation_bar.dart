import 'package:ed_project/activity/activities_page.dart';
import 'package:ed_project/add_task_bar.dart';
import 'package:ed_project/home_page.dart';
import 'package:ed_project/settings/settings_page.dart';
import 'package:ed_project/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    ActivityPage(),
    SettingsOnePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        backgroundColor: PrimaryClr,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        iconSize: 25,
        selectedFontSize: 16,
        unselectedFontSize: 13,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline), label: 'Activities'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
