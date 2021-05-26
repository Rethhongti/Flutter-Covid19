import 'package:flutter/material.dart';
import 'EmergenData.dart';
import 'package:url_launcher/url_launcher.dart';
class EmergencyCall extends StatefulWidget {
  @override
  _EmergencyCallState createState() => _EmergencyCallState();
}

class _EmergencyCallState extends State<EmergencyCall> {
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
        title: Text("ទំនាក់ទំនងសង្គ្រោះបន្ទាន់"),
        backgroundColor: Colors.orange,
      ),
      body: _buildBody,
    );
  }
  get _buildBody{
    return ListView.builder(
      itemCount: data.emergencyCall.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(data.emergencyCall[index]['icon']),
            ),
            title: Text(data.emergencyCall[index]['name']),
            subtitle: Text(data.emergencyCall[index]['phone']),
            trailing: IconButton(
              icon: Icon(Icons.phone),
              onPressed: (){
                _makePhoneCall('tel:${data.emergencyCall[index]['phone']}');
              },
            ),
          ),
        );
      },
    );
  }
}
