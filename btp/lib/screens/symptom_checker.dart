import 'package:btp/screens/screen_one.dart';
import 'package:btp/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SymptomChecker extends StatelessWidget {
  const SymptomChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size.height);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: Dimensions.height200,
              width: double.maxFinite,
              color: Color(0xFF2d8089),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, top: Dimensions.height70),
              child: Hero(
                tag: 'Title',
                child: Text(
                  "Symptom Check",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.height40,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.height200 - Dimensions.height20,
            child: Container(
              height: Dimensions.screenHeight +
                  Dimensions.height20 -
                  Dimensions.height200,
              width: double.maxFinite,
              padding: EdgeInsets.only(
                  top: Dimensions.height20, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Selected Symptoms",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Row(
                    children: [
                      Container(
                        //height: 50,
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 10,
                          top: 18,
                          bottom: 18,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFFe4efef),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "High Fever",
                              style: TextStyle(
                                color: Color(0xFF2d8089),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.close,
                              size: 15,
                              color: Colors.blueGrey,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.width20,
                      ),
                      Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 20, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFFe4efef),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Abdominal Pain",
                              style: TextStyle(
                                color: Color(0xFF2d8089),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.close,
                              size: 15,
                              color: Colors.blueGrey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Text(
                    "All Symptoms",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF2d8089),
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                      ),
                      hintText: "Search Symptoms",
                      //labelText
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        borderSide: BorderSide(
                          color: Color(0xFF2d8089),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 20,
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
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: CheckboxListTile(
                              value: false,
                              onChanged: (context) {},
                              checkColor: Color(0xFF2d8089),
                              activeColor: Color(0xFFe4efef),
                              side: BorderSide(
                                color: Colors.blueGrey,
                              ),
                              title: Text(
                                "High Fever",
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
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.screenHeight - Dimensions.height70,
            child: GestureDetector(
              onTap: () {
                Get.to(() => ScreenOne());
              },
              child: Container(
                height: 70,
                width: double.maxFinite,
                color: Color(0xFF2d8089),
                child: Center(
                  child: Text(
                    "Detect Disease",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
