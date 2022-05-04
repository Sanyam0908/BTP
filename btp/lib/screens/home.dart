import 'package:btp/screens/disease.dart';
import 'package:btp/screens/symptoms.dart';
import 'package:btp/screens/symptoms_list.dart';
import 'package:btp/screens/test.dart';
import 'package:btp/widgets/symptom_column.dart';
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

  void addtoSelectedSymptom(List<dynamic> tempSelectedSymptom) {
    for (var i = 0; i < tempSelectedSymptom.length; i++) {
      if (!selectedSymptoms.contains(tempSelectedSymptom[i])) {
        selectedSymptoms.add(tempSelectedSymptom[i]);
        symptoms.addData(tempSelectedSymptom[i]);
      }
    }
  }

  void addSelectedSymptoms(String str) {
    symptoms.addData(str);
  }

  void deleteSelected(String str) {
    selectedSymptoms.remove(str);
    symptoms.deleteData(str);
    Get.find<SymptomsList>().checkValue(str);
  }

  void deleteAll() {
    selectedSymptoms = [];
    symptoms.emptySelected();
    Get.find<SymptomsList>().setValues();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(SymptomsList());
    // Get.find<SymptomsList>();
    // SymptomsList().setValues();
    selectedSymptoms = [];
    SymptomsList().emptySelected();
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
            Flexible(
              child: Container(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                width: double.maxFinite,
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
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      print(symptoms.selectedSymptoms);
                    },
                    child: Text('Doctor Data'),
                  ),
                ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Selected Symptoms",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            deleteAll();
                          });
                        },
                        child: Text(
                          'Remove all',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 55,
                    child: symptoms.selectedSymptoms.length == 0
                        ? Center(
                            child: Text('Select Symptoms'),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: symptoms.selectedSymptoms.length,
                            itemBuilder: (context, index) {
                              final selSymptom =
                                  symptoms.selectedSymptoms[index];
                              return Container(
                                margin: EdgeInsets.only(
                                  right: 5,
                                ),
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 18,
                                  bottom: 18,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFFe4efef),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      selSymptom,
                                      style: TextStyle(
                                        color: Color(0xFF2d8089),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          deleteSelected(selSymptom);
                                        });
                                        Get.snackbar(
                                          'Symptom Removed',
                                          'Symptom Removed',
                                          duration: Duration(milliseconds: 600),
                                        );
                                      },
                                      child: Icon(
                                        Icons.close,
                                        size: 18,
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
                          var tempSelectedSymptoms =
                              await Get.to(() => Symptoms());
                          setState(() {
                            addtoSelectedSymptom(tempSelectedSymptoms);
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
                          if (!selectedSymptoms.contains('High Fever')) {
                            Get.find<SymptomsList>().checkValue('High Fever');
                            selectedSymptoms.add('High Fever');
                            setState(() {
                              addSelectedSymptoms('High Fever');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/fever.png',
                          text: 'High Fever',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Cough')) {
                            selectedSymptoms.add('Cough');
                            setState(() {
                              Get.find<SymptomsList>().checkValue('Cough');
                              addSelectedSymptoms('Cough');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
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
                          if (!selectedSymptoms.contains('Vomiting')) {
                            Get.find<SymptomsList>().checkValue('Vomiting');
                            selectedSymptoms.add('Vomiting');
                            setState(() {
                              addSelectedSymptoms('Vomiting');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/vomit.png',
                          text: 'Vomiting',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Runny Nose')) {
                            Get.find<SymptomsList>().checkValue('Runny Nose');
                            selectedSymptoms.add('Runny Nose');
                            setState(() {
                              addSelectedSymptoms('Runny Nose');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/running-nose.png',
                          text: 'Runny Nose',
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
                          if (!selectedSymptoms.contains('Diarrhoea')) {
                            Get.find<SymptomsList>().checkValue('Diarrhoea');
                            selectedSymptoms.add('Diarrhoea');
                            setState(() {
                              addSelectedSymptoms('Diarrhoea');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/diarrhea.png',
                          text: 'Diarrhoea',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Headache')) {
                            Get.find<SymptomsList>().checkValue('Headache');
                            selectedSymptoms.add('Headache');
                            setState(() {
                              addSelectedSymptoms('Headache');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
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
                            Get.find<SymptomsList>().checkValue('Shivering');
                            selectedSymptoms.add('Shivering');
                            setState(() {
                              addSelectedSymptoms('Shivering');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
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
                            Get.find<SymptomsList>().checkValue('Joint Pain');
                            selectedSymptoms.add('Joint Pain');
                            setState(() {
                              addSelectedSymptoms('Joint Pain');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
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
                selectedSymptoms.isNotEmpty
                    ? showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Do you wish to proceed?"),
                            content: Text(
                                'You cannot change selected symptoms later'),
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text('Close'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.find<SymptomsList>().setValues();
                                  Get.back();
                                  Get.off(() => Test(),
                                      arguments: selectedSymptoms);
                                },
                                child: Text('Yes'),
                              ),
                            ],
                          );
                        },
                      )
                    : Get.snackbar(
                        'Select Symptoms', 'Please add symptoms to proceed');
                //Get.off(() => Test(), arguments: selectedSymptoms);
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
