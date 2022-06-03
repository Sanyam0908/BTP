import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorInfo extends StatefulWidget {
  const DoctorInfo({Key? key}) : super(key: key);

  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  dynamic doctorsInfo = [];

  List<String> entries = [
    'Name:',
    'City:',
    'Specialization:',
    'Address:',
    'Degree:',
    'State:'
  ];

  @override
  initState() {
    super.initState();
    doctorsInfo = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Doctor Info',
          ),
          backgroundColor: Color(0xFF2d8089),
        ),
        backgroundColor: Color(0xFFe4efef),
        body: Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 20,
            top: 20,
          ),
          child: Container(
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
                  doctorsInfo[0].toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: doctorsInfo.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_forward),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            entries[index],
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              doctorsInfo[index].toString(),
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
