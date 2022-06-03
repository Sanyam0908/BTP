import 'package:carearea/screens/doctor_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  bool firstTime = true;
  final CollectionReference _doctors =
      FirebaseFirestore.instance.collection('Doctors');

  String dropDownValue = 'Select';
  //String locationCity = 'Jaipur';

  var items = [
    'Select',
    'Jaipur',
    'Ajmer',
    'Udaipur',
    'Jodhpur',
    'Jaisalmer',
    'Kota',
    'Bikaner',
  ];

  Map<String, dynamic> data = {};
  List<dynamic> result = [];
  List<dynamic> locationResult = [];
  List<dynamic> argument = [];
  PageController controller = PageController();

  // Future<void> getDocs() async {
  //   QuerySnapshot querySnapshot =
  //       await FirebaseFirestore.instance.collection('Doctors').get();
  //   for (int i = 0; i < querySnapshot.docs.length; i++) {
  //     var a = querySnapshot.docs[i];
  //     data.addAll({
  //       a['Name']: [
  //         a['Name'],
  //         a['City'],
  //         a['Specialization'],
  //       ]
  //     });
  //   }
  // }

  // dynamic updateLocationList() {
  //   locationResult = [];
  //   data.forEach((key, value) {
  //     if (value[1] == locationCity) {
  //       locationResult.add(value);
  //     }
  //   });
  // }

  dynamic updateList() {
    result = [];
    data.forEach((key, value) {
      if (dropDownValue == 'Select') {
        result.add(value);
      } else {
        if (value[1] == dropDownValue) {
          result.add(value);
        }
      }
    });
  }

  @override
  void initState() {
    //getDocs();
    argument = Get.arguments;
    locationResult = argument[0];
    data = argument[1];
  }

  @override
  Widget build(BuildContext context) {
    print(argument[2]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctor Page',
        ),
        backgroundColor: Color(0xFF2d8089),
      ),
      backgroundColor: Color(0xFFe4efef),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 10,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Doctors Near You:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 150,
                width: double.maxFinite,
                child: ListView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: locationResult.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => DoctorInfo(),
                            arguments: locationResult[index]);
                      },
                      child: Container(
                        width: 350,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(right: 10),
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
                              locationResult[index][0],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 2,
                              //indent: 10,
                              //endIndent: 10,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              locationResult[index][2],
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'TAP FOR MORE INFO',
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
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: locationResult.length,
                  effect: ScaleEffect(
                    activeDotColor: Color(0xff2d8089),
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 8,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Doctors in Different Cities: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                DropdownButton(
                  value: dropDownValue,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0XFF2d8089),
                  ),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: TextStyle(
                          color: Color(0xFF2d8089),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      firstTime = false;
                      dropDownValue = newValue!;
                      updateList();
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: firstTime == true
                  ? StreamBuilder(
                      stream: _doctors.snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return ListView.builder(
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];
                              dynamic info = [];
                              info.add(documentSnapshot['Name']);
                              info.add(documentSnapshot['City']);
                              info.add(documentSnapshot['Specialization']);
                              info.add(documentSnapshot['Address']);
                              info.add(documentSnapshot['Degree']);
                              info.add(documentSnapshot['State']);
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => DoctorInfo(), arguments: info);
                                },
                                child: Container(
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(top: 5, bottom: 5),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        documentSnapshot['Name'],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            documentSnapshot['Specialization'],
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            documentSnapshot['City'],
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'TAP FOR MORE INFO',
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
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => DoctorInfo(),
                                arguments: result[index]);
                          },
                          child: Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(top: 5, bottom: 5),
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
                                    result[index][0],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        result[index][2],
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        result[index][1],
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'TAP FOR MORE INFO',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
