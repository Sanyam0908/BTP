import 'package:btp/screens/symptoms_list.dart';
import 'package:flutter/material.dart';

class SymptomContainer extends StatelessWidget {
  final String text;
  SymptomContainer({Key? key, required this.text}) : super(key: key);

  SymptomsList symptoms = SymptomsList();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 10,
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 10,
        top: 18,
        bottom: 18,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFe4efef),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF2d8089),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              //symptoms.deleteData(text);
            },
            child: Icon(
              Icons.close,
              size: 15,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
