import 'package:flutter/material.dart';
import 'package:btp/screens/medicines.dart';

class DiseasePage extends StatelessWidget {
  const DiseasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> data = Medicines().medicines;
    Map<String, List<String>> info = Medicines().example;
    return Scaffold(
      body: Center(
        child: Text(
          info['GERD'].toString(),
        ),
      ),
    );
  }
}
