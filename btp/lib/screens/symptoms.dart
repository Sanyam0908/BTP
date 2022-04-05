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
  List<bool> _values = List<bool>.filled(133, false);
  List<String> symptomsList = SymptomsList().symptomsList;
  List<String> selectedSymptoms = [];

  void updateList() {
    for (var x = 0; x < symptomsList.length; x++) {
      if (_values[x]) {
        selectedSymptoms.add(symptomsList[x]);
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
            FocusManager.instance.primaryFocus?.unfocus();
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
                prefixIcon: Icon(
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
              onChanged: searchSymptom,
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
                    itemCount: symptomsList.length,
                    itemBuilder: (context, index) {
                      final symptom = symptomsList[index];
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
                            symptomsList[index],
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
                FocusManager.instance.primaryFocus?.unfocus();
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

  void searchSymptom(String query) {
    final suggestions = symptomsList.where((symptom) {
      final input = query.toLowerCase();
      final symptomTitle = symptom.toLowerCase();

      return symptomTitle.contains(input);
    }).toList();

    setState(() {
      symptomsList = suggestions;
    });
  }
}
