import 'package:btp/screens/home.dart';
import 'package:btp/screens/screen_one.dart';
import 'package:btp/screens/symptom_checker.dart';
import 'package:btp/screens/symptoms.dart';
import 'package:btp/screens/test.dart';
import 'package:btp/utils/dimensions.dart';
import 'package:btp/widgets/symptom_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:btp/widgets/symptom_column.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}
