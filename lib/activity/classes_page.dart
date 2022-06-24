import 'package:flutter/material.dart';

class ClassesPage extends StatelessWidget {
  const ClassesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Classes",style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,

          ),),
        )
    );
  }
}