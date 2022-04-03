import 'package:flutter/material.dart';

class DiseasePage extends StatelessWidget {
  const DiseasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'MedBuddy',
        ),
        backgroundColor: Color(0xFF2d8089),
      ),
    );
  }
}
