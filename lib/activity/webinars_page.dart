import 'package:flutter/material.dart';

class WebinarsPage extends StatelessWidget {
  const WebinarsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Webinars",style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,

          ),),
        )
    );
  }
}