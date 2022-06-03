import 'package:flutter/material.dart';

class SymptomColumn extends StatelessWidget {
  final String imageUrl;
  final String text;
  const SymptomColumn({
    Key? key,
    required this.imageUrl,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            height: 50,
            width: 50,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
