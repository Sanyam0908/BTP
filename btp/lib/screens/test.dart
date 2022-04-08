import 'dart:convert';
import 'package:btp/screens/symptoms_list.dart';
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

String secondHalf = "";

void updateList() {
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

    // var data = Get.arguments;
    // print(data);
    updateList();
    futureDiseaseModelList = fetchDisease();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: FutureBuilder(
        future: futureDiseaseModelList,
        builder: (context, AsyncSnapshot<List<DiseaseModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            diseaseList.add(snapshot.data![0].disease);
            for (var x = 0; x < snapshot.data!.length - 1; x++) {
              var name = snapshot.data![x].disease;
              var nextName = snapshot.data![x + 1].disease;
              if (name != nextName) {
                diseaseList.add(name);
              }
            }
            return ListView.builder(
              itemCount: diseaseList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 6.0,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 6,
                      bottom: 6,
                      left: 8,
                      right: 8,
                    ),
                    child: Text(diseaseList[index]),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
