import 'package:carearea/models/disease_model.dart';
import 'package:carearea/utils/medicines.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carearea/utils/precautions.dart';

class DiseaseInfo extends StatefulWidget {
  const DiseaseInfo({Key? key}) : super(key: key);

  @override
  State<DiseaseInfo> createState() => _DiseaseInfoState();
}

class _DiseaseInfoState extends State<DiseaseInfo> {
  String modifySymptom(String symptom) {
    String result = "";
    result += symptom[0].toUpperCase();
    for (var i = 1; i < symptom.length; i++) {
      if (symptom[i] == "_") {
        result += " ";
        result += symptom[i + 1].toUpperCase();
        i++;
      } else {
        result += symptom[i];
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    DiseaseModel info = Get.arguments;
    Map<String, String> medicine = Medicines().medicines;
    List<String> symptoms = [];
    if (info.symptom1 != "")
      symptoms.add(modifySymptom(info.symptom1.toString()));
    if (info.symptom2 != "")
      symptoms.add(modifySymptom(info.symptom2.toString()));
    if (info.symptom3 != "")
      symptoms.add(modifySymptom(info.symptom3.toString()));
    if (info.symptom4 != "")
      symptoms.add(modifySymptom(info.symptom4.toString()));
    if (info.symptom5 != "")
      symptoms.add(modifySymptom(info.symptom5.toString()));
    if (info.symptom6 != "")
      symptoms.add(modifySymptom(info.symptom6.toString()));
    if (info.symptom7 != "")
      symptoms.add(modifySymptom(info.symptom7.toString()));
    if (info.symptom8 != "")
      symptoms.add(modifySymptom(info.symptom8.toString()));
    if (info.symptom9 != "")
      symptoms.add(modifySymptom(info.symptom9.toString()));
    if (info.symptom10 != "")
      symptoms.add(modifySymptom(info.symptom10.toString()));
    if (info.symptom11 != "")
      symptoms.add(modifySymptom(info.symptom11.toString()));
    if (info.symptom12 != "")
      symptoms.add(modifySymptom(info.symptom12.toString()));
    if (info.symptom13 != "")
      symptoms.add(modifySymptom(info.symptom13.toString()));
    if (info.symptom14 != "")
      symptoms.add(modifySymptom(info.symptom14.toString()));
    if (info.symptom15 != "")
      symptoms.add(modifySymptom(info.symptom15.toString()));
    if (info.symptom16 != "")
      symptoms.add(modifySymptom(info.symptom16.toString()));
    if (info.symptom17 != "")
      symptoms.add(modifySymptom(info.symptom17.toString()));
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
          info.disease.toString(),
        ),
        backgroundColor: Color(0xFF2d8089),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 20,
          top: 20,
        ),
        child: ListView(
          children: [
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(20),
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
                    'All Symptoms',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                    //indent: 10,
                    //endIndent: 10,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: symptoms.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_forward),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              symptoms[index].toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(20),
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
                    'Precautions',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: Precautions().precautions.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_forward),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              Precautions().precautions[index],
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(20),
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
                    'Medicines',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          Medicines()
                              .medicines[info.disease.toString()]
                              .toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
