import 'package:btp/models/disease_model.dart';
import 'package:btp/screens/medicines.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiseaseInfo extends StatefulWidget {
  const DiseaseInfo({Key? key}) : super(key: key);

  @override
  State<DiseaseInfo> createState() => _DiseaseInfoState();
}

class _DiseaseInfoState extends State<DiseaseInfo> {
  @override
  Widget build(BuildContext context) {
    DiseaseModel info = Get.arguments;
    Map<String, String> medicine = Medicines().medicines;
    List<String> symptoms = [];
    if (info.symptom1 != "") symptoms.add(info.symptom1.toString());
    if (info.symptom2 != "") symptoms.add(info.symptom2.toString());
    if (info.symptom3 != "") symptoms.add(info.symptom3.toString());
    if (info.symptom4 != "") symptoms.add(info.symptom4.toString());
    if (info.symptom5 != "") symptoms.add(info.symptom5.toString());
    if (info.symptom6 != "") symptoms.add(info.symptom6.toString());
    if (info.symptom7 != "") symptoms.add(info.symptom7.toString());
    if (info.symptom8 != "") symptoms.add(info.symptom8.toString());
    if (info.symptom9 != "") symptoms.add(info.symptom9.toString());
    if (info.symptom10 != "") symptoms.add(info.symptom10.toString());
    if (info.symptom11 != "") symptoms.add(info.symptom11.toString());
    if (info.symptom12 != "") symptoms.add(info.symptom12.toString());
    if (info.symptom13 != "") symptoms.add(info.symptom13.toString());
    if (info.symptom14 != "") symptoms.add(info.symptom14.toString());
    if (info.symptom15 != "") symptoms.add(info.symptom15.toString());
    if (info.symptom16 != "") symptoms.add(info.symptom16.toString());
    if (info.symptom17 != "") symptoms.add(info.symptom17.toString());
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
          left: 10,
          right: 10,
          top: 20,
          bottom: 10,
        ),
        child: Column(
          children: [
            Container(
              height: 420,
              width: double.maxFinite,
              padding: EdgeInsets.all(10),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'All Symptoms of ${info.disease}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2d8089),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: symptoms.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 70,
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 5,
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFe4efef),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              symptoms[index],
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
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
                child: Text(medicine[info.disease].toString()),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
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
                child: Text('Doctors'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
