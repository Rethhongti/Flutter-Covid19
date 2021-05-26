import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'EmergenData.dart';

class PoliceProviceContact extends StatefulWidget {
  @override
  _PoliceProviceContactState createState() => _PoliceProviceContactState();
}

class _PoliceProviceContactState extends State<PoliceProviceContact> {
  EmergencyData data = EmergencyData();

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
    throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/police.jpg"),
            ),
            Text("ស្នងការនគរបាលទាំង​២៥​ខេត្ត-ក្រុង"),
          ],
        ),
        backgroundColor: Colors.orange,
      ),
      body: _buildBody,
    );
  }
  get _buildBody{
    return ListView.builder(
      itemCount: data.police25.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("images/policeAvatar.jpg"),
            ),
            title: Text(data.police25[index]['provice']),
            subtitle: Text(data.police25[index]['phone']),
            trailing: IconButton(
              icon: Icon(Icons.phone),
              onPressed: (){
                _makePhoneCall('tel:${data.police25[index]['phone']}');
              },
            ),
          ),
        );
      },
    );
  }
}
