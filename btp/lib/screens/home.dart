import 'package:btp/screens/disease.dart';
import 'package:btp/screens/symptoms.dart';
import 'package:btp/widgets/symptom_column.dart';
import 'package:btp/widgets/symptom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MedBuddy',
        ),
        backgroundColor: Color(0xFF2d8089),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Color(0xFFe4efef),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selected Symptoms",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SymptomContainer(
                        text: 'High Fever',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SymptomContainer(
                        text: 'Abdominal Pain',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SymptomContainer(
                        text: 'Cough',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SymptomContainer(
                        text: 'Running Nose',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "All Symptoms",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Symptoms(),
                            ),
                          );
                        },
                        child: Text(
                          'See more',
                          style: TextStyle(
                            color: Color(0xFF2d8089),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SymptomColumn(
                        imageUrl: 'assets/image/fever.png',
                        text: 'Fever',
                      ),
                      SymptomColumn(
                        imageUrl: 'assets/image/cough.png',
                        text: 'Cough',
                      ),
                      SymptomColumn(
                        imageUrl: 'assets/image/vomit.png',
                        text: 'Vomitting',
                      ),
                      SymptomColumn(
                        imageUrl: 'assets/image/running-nose.png',
                        text: 'Running Nose',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SymptomColumn(
                        imageUrl: 'assets/image/diarrhea.png',
                        text: 'Diarrhea',
                      ),
                      SymptomColumn(
                        imageUrl: 'assets/image/decreased-concentration.png',
                        text: 'Headache',
                      ),
                      SymptomColumn(
                        imageUrl: 'assets/image/shivers.png',
                        text: 'Shivering',
                      ),
                      SymptomColumn(
                        imageUrl: 'assets/image/broken-bone.png',
                        text: 'Joint Pain',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => DiseasePage()),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF2d8089),
                ),
                child: Center(
                  child: Text(
                    'Predict Disease',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
