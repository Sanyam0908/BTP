import 'dart:convert';
import 'package:carearea/screens/disease_info.dart';
import 'package:carearea/screens/home.dart';
import 'package:carearea/utils/symptoms_list.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:carearea/models/disease_model.dart';
import 'package:carearea/utils/descriptions.dart';

//https://disease-detection.p.rapidapi.com/get_disease/cough,high_fever,vomiting

List<DiseaseModel> diseaseModelFromJson(String str) => List<DiseaseModel>.from(
    json.decode(str).map((x) => DiseaseModel.fromJson(x)));

Map<String, String> headers = {
  "Content-type": "application/json",
  "X-RapidAPI-Host": "disease-detection.p.rapidapi.com",
  "X-RapidAPI-Key": "19ebbbd8bdmsh9e5caa67d50bc7ap18abd4jsnd51f33ddb71e"
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
            if (snapshot.data == null) {
              return Text('No data');
            } else {
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
                                            Descriptions()
                                                .descriptions[
                                                    diseaseList[index]]
                                                .toString(),
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
            return Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return buildDiseaseShimmer();
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildDiseaseShimmer() => Container(
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
            Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor: Colors.grey[300]!,
              child: Container(
                width: 200,
                height: 30,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor: Colors.grey[300]!,
              child: Container(
                width: double.maxFinite,
                height: 130,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  highlightColor: Colors.grey[300]!,
                  child: Container(
                    width: 100,
                    height: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
