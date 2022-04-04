import 'package:btp/screens/home.dart';
import 'package:btp/screens/symptoms_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Symptoms extends StatefulWidget {
  Symptoms({Key? key}) : super(key: key);

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  SymptomsList symptoms = SymptomsList();
  var _values = List<bool>.filled(133, false);
  List<String> selectedSymptoms = [];
  void updateList() {
    for (var x = 0; x < symptoms.symptomsList.length; x++) {
      if (_values[x]) {
        selectedSymptoms.add(symptoms.symptomsList[x]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MedBuddy',
        ),
        backgroundColor: Color(0xFF2d8089),
        leading: GestureDetector(
          onTap: () {
            //Navigator.pop(context);
            updateList();
            Get.back(result: selectedSymptoms);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
          bottom: 10,
        ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF2d8089),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Search Symptoms",
                //labelText
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xFF2d8089),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
                child: SingleChildScrollView(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: symptoms.symptomsList.length,
                    itemBuilder: (context, index) {
                      return Container(
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
                        child: CheckboxListTile(
                          value: _values[index],
                          onChanged: (value) {
                            setState(() {
                              _values[index] = value!;
                            });
                          },
                          checkColor: Color(0xFF2d8089),
                          activeColor: Color(0xFFe4efef),
                          side: BorderSide(
                            color: Colors.blueGrey,
                          ),
                          title: Text(
                            symptoms.symptomsList[index],
                            style: TextStyle(
                              color: Color(0xFF2d8089),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                updateList();
                Get.back(result: selectedSymptoms);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF2d8089),
                ),
                height: 50,
                child: Center(
                  child: Text(
                    'Add Symptoms',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
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
