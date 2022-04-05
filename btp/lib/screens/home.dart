import 'package:btp/screens/disease.dart';
import 'package:btp/screens/symptoms.dart';
import 'package:btp/screens/symptoms_list.dart';
import 'package:btp/widgets/symptom_column.dart';
import 'package:btp/widgets/symptom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> selectedSymptoms = [];
  SymptomsList symptoms = SymptomsList();
  List<String> symptomsList = SymptomsList().symptomsList;

  void addSelectedSymptoms() {
    for (var x = 0; x < selectedSymptoms.length; x++) {
      if (!symptoms.selectedSymptoms.contains(selectedSymptoms[x])) {
        symptoms.addData(selectedSymptoms[x]);
      }
    }
  }

  void deleteSelected(String str) {
    symptoms.deleteData(str);
    selectedSymptoms = symptoms.selectedSymptoms;
  }

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
                  Container(
                    height: 55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: symptoms.selectedSymptoms.length,
                      itemBuilder: (context, index) {
                        final selSymptom = symptoms.selectedSymptoms[index];
                        return GestureDetector(
                          // onDoubleTap: () {
                          //   setState(() {
                          //     deleteSelected(selSymptom);
                          //   });
                          // },
                          child: Row(
                            children: [
                              SymptomContainer(
                                text: selSymptom,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    deleteSelected(selSymptom);
                                  });
                                },
                                child: Icon(
                                  Icons.close,
                                  size: 20,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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
                        onTap: () async {
                          selectedSymptoms = await Get.to(() => Symptoms());
                          setState(() {
                            addSelectedSymptoms();
                          });
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
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Fever')) {
                            selectedSymptoms.add('Fever');
                            setState(() {
                              addSelectedSymptoms();
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/fever.png',
                          text: 'Fever',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Cough')) {
                            selectedSymptoms.add('Cough');
                            setState(() {
                              addSelectedSymptoms();
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/cough.png',
                          text: 'Cough',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Vomitting')) {
                            selectedSymptoms.add('Vomitting');
                            setState(() {
                              addSelectedSymptoms();
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/vomit.png',
                          text: 'Vomitting',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Runnning Nose')) {
                            selectedSymptoms.add('Runnning Nose');
                            setState(() {
                              addSelectedSymptoms();
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/running-nose.png',
                          text: 'Running Nose',
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
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Diarrhea')) {
                            selectedSymptoms.add('Diarrhea');
                            setState(() {
                              addSelectedSymptoms();
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/diarrhea.png',
                          text: 'Diarrhea',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Headache')) {
                            selectedSymptoms.add('Headache');
                            setState(() {
                              addSelectedSymptoms();
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/decreased-concentration.png',
                          text: 'Headache',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Shivering')) {
                            selectedSymptoms.add('Shivering');
                            setState(() {
                              addSelectedSymptoms();
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/shivers.png',
                          text: 'Shivering',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Joint Pain')) {
                            selectedSymptoms.add('Joint Pain');
                            setState(() {
                              addSelectedSymptoms();
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/broken-bone.png',
                          text: 'Joint Pain',
                        ),
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
