import 'package:covid19/CovidContactScreen.dart';
import 'package:covid19/EmergencyCall.dart';
import 'package:covid19/PoliceProviceContact.dart';
import 'package:covid19/PoliceppContactScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class EmergencyScreen extends StatefulWidget {
  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {

  List contactType = [
    {
      "image" : "images/covid.png",
      "title" : "ទំនាក់ទំនងបញ្ហាកូវីត",
      "route" : CovidContactScreen()
    },
    {
      "image" : "images/em.png",
      "title" : "ទំនាក់ទំនងសង្គ្រោះបន្ទាន់",
      "route" : EmergencyCall()
    },
    {
      "image" : "images/police.jpg",
      "title" : "អធិការខណ្ឌទាំង១៤",
      "route" : PoliceppContactScreen()
    },
    {
      "image" : "images/police.jpg",
      "title" : "ស្នងការទាំង​២៥​ខេត្ត-ក្រុង",
      "route" : PoliceProviceContact()
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Emergency"),
        leading: Icon(Icons.phone),
      ),
      body: _buildContactBody,
    );
  }
  get _buildContactBody{
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount:4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5
        ),
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.orange,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                      height:130,
                      child: Image.asset(contactType[index]['image'],)
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(contactType[index]['title'],
                    style: TextStyle(
                      fontSize: 17
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context, PageTransition(child: contactType[index]['route'], type: PageTransitionType.rightToLeft));
            },
          );
        },
      ),
    );
  }
}
