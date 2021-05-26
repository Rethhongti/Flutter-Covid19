import 'package:flutter/material.dart';

class Cases extends StatelessWidget {
  final String title;
  final String caseNum;
  final Color clr;

  Cases({this.title,this.caseNum,this.clr});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(this.title,
          style: TextStyle(
            fontSize: 17,
            color: clr,
          ),
        ),
        Text(this.caseNum,
          style: TextStyle(
            fontSize: 24,
            color: clr,
          ),
        ),
      ],
    );
  }
}
