import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipScreen extends StatefulWidget {
  @override
  _TipScreenState createState() => _TipScreenState();
}

class _TipScreenState extends State<TipScreen> {
  List tip = [
    "លាងដៃអោយញឹកញាប់",
    "ប្រើអាល់កុល ឬ ជែល",
    "ពាក់ម៉ាស់ជានិច្ច",
    "កុំប៉ះពាល់ផ្ទៃមុខ",
    "ខ្ទប់មាត់ពេលអ្នកក្អក",
    "រក្សាគម្លាតសុវត្ថិភាព",
    "សម្អាតវត្ថុប្រើប្រាស់"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: 60,
              child: Image.asset("images/covid.png",color: Colors.white),
            ),
            Text("Tips for Safe"),
          ],
        ),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                child: Image.asset("images/covidbanner.jpg",
                  fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ) ,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              child: Image.asset("images/Picture${index+1}.png"),
                            height: 120,
                          ),
                          Text(tip[index],
                            style: TextStyle(
                              fontSize: 17
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
