import 'package:flutter/material.dart';

class AssignmentPage extends StatelessWidget {
  const AssignmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Assignment",style: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,

    ),),
    )
    );
  }
}
