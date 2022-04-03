import 'package:flutter/material.dart';

class SymptomContainer extends StatelessWidget {
  final String text;
  const SymptomContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Icon(
            Icons.close,
            size: 15,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
