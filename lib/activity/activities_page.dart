import 'package:ed_project/activity/assignment_page.dart';
import 'package:ed_project/activity/classes_page.dart';
import 'package:ed_project/activity/clubs_page.dart';
import 'package:ed_project/activity/quizzes_page.dart';
import 'package:ed_project/activity/webinars_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Activities Page",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(0),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size.fromHeight(146),
                    textStyle:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    primary: Colors.black,
                    side: BorderSide(width: 3, color: Colors.black),
                    // onPrimary: Colors.black,
                  ),
                  child: Text('Assignments'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AssignmentPage()));
                  }),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(0),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size.fromHeight(146),
                    textStyle:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    primary: Colors.black,
                    side: BorderSide(width: 3, color: Colors.black),
                    // onPrimary: Colors.black,
                  ),
                  child: Text('Quizzes'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => QuizzesPage()));
                  }),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(0),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size.fromHeight(146),
                    textStyle:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    primary: Colors.black,
                    side: BorderSide(width: 3, color: Colors.black),
                    // onPrimary: Colors.black,
                  ),
                  child: Text('Webinars'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WebinarsPage()));
                  }),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(0),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size.fromHeight(146),
                    textStyle:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    primary: Colors.black,
                    side: BorderSide(width: 3, color: Colors.black),
                    // onPrimary: Colors.black,
                  ),
                  child: Text('Classes'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ClassesPage()));
                  }),
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(0),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(146),
                  textStyle:
                      TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  primary: Colors.black,
                  side: BorderSide(width: 3, color: Colors.black),
                  // onPrimary: Colors.black,
                ),
                child: Text('Clubs'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ClubsPage()));
                }),
          )),
        ],
      ),
    );
  }
}
