import 'package:flutter/material.dart';

class QuizzesPage extends StatelessWidget {
  const QuizzesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quizzes",style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,

          ),),
        )
    );
  }
}