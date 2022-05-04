import 'dart:convert';
import 'package:btp/screens/disease_info.dart';
import 'package:btp/screens/home.dart';
import 'package:btp/screens/symptoms_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:btp/models/disease_model.dart';

//https://disease-detection.p.rapidapi.com/get_disease/cough,high_fever,vomiting

List<DiseaseModel> diseaseModelFromJson(String str) => List<DiseaseModel>.from(
    json.decode(str).map((x) => DiseaseModel.fromJson(x)));

Map<String, String> headers = {
  "Content-type": "application/json",
  "X-RapidAPI-Host": "disease-detection.p.rapidapi.com",
  "X-RapidAPI-Key": "b8abe025dbmshb34ff7d01d68869p1dd142jsn43e585b1cfd4"
};
List<dynamic> diseaseList = [];

List<DiseaseModel> info = [];

String secondHalf = "";

void updateList() {
  secondHalf = "";
  var selecSymtoms = Get.arguments;

  for (var i = 0; i < selecSymtoms.length; i++) {
    secondHalf += selecSymtoms[i].toString().toLowerCase();
    String res = secondHalf.replaceAll(' ', '_');
    secondHalf = res;
    if (i != selecSymtoms.length - 1) {
      secondHalf += ',';
    }
  }
  print(secondHalf);
}

Future<List<DiseaseModel>> fetchDisease() async {
  var firstHalf = 'https://disease-detection.p.rapidapi.com/get_disease/';

  final response =
      await http.get(Uri.parse(firstHalf + secondHalf), headers: headers);

  if (response.statusCode == 200) {
    return diseaseModelFromJson(response.body);
  } else {
    return throw Exception('Failed to load data');
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late Future<List<DiseaseModel>> futureDiseaseModelList;

  @override
  void initState() {
    super.initState();
    info = [];
    updateList();
    futureDiseaseModelList = fetchDisease();
  }

  @override
  void dispose() {
    super.dispose();
    diseaseList = [];
    SymptomsList().emptySelected();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        backgroundColor: Color(0XFF2d8089),
      ),
      body: FutureBuilder(
        future: futureDiseaseModelList,
        builder: (context, AsyncSnapshot<List<DiseaseModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null)
              return Text('No data');
            else {
              if (snapshot.data!.isNotEmpty) {
                for (var x = 0; x < snapshot.data!.length; x++) {
                  if (!diseaseList.contains(snapshot.data![x].disease)) {
                    info.add(snapshot.data![x]);
                    diseaseList.add(snapshot.data![x].disease);
                  }
                }
              }
              return diseaseList.isEmpty
                  ? Center(
                      child: Container(
                        //height: double.maxFinite,
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 20,
                          bottom: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/image/cheemsDancingFinal.gif',
                              height: 200,
                              width: 200,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'No Disease found',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Sit Back and Relax!!',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                //Get.back();
                                Get.off(() => Home());
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFF2d8089),
                                ),
                                child: Center(
                                  child: Text(
                                    'Done',
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
                    )
                  : Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 20,
                        bottom: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: diseaseList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      print(info[index].disease);
                                      Get.to(
                                        () => DiseaseInfo(),
                                        arguments: info[index],
                                      );
                                    },
                                    child: Container(
                                      width: double.maxFinite,
                                      padding: EdgeInsets.all(20),
                                      margin: EdgeInsets.only(bottom: 20),
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
                                          Text(
                                            diseaseList[index],
                                            style: TextStyle(
                                              fontSize: 30,
                                              color: Color(0xFF2d8089),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Diabetes is a disease that occurs when your blood glucose, also called blood sugar, is too high. Blood glucose is your main source of energy and comes from the food you eat. Insulin, a hormone made by the pancreas, helps glucose from food get into your cells to be used for energy.',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'TAP TO LEARN MORE',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              //Get.back();
                              Get.off(() => Home());
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xFF2d8089),
                              ),
                              child: Center(
                                child: Text(
                                  'Done',
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
                    );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
