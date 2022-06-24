import 'package:flutter/material.dart';

class ClubsPage extends StatelessWidget {
  const ClubsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Clubs",style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,

          ),),
        )
    );
  }
}