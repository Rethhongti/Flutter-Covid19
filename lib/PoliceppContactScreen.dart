import 'package:covid19/EmergenData.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PoliceppContactScreen extends StatefulWidget {
  @override
  _PoliceppContactScreenState createState() => _PoliceppContactScreenState();
}

class _PoliceppContactScreenState extends State<PoliceppContactScreen> {
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
            Text("អធិការនគរបាលខណ្ឌទាំង១៤"),
          ],
        ),
        backgroundColor: Colors.orange,
      ),
      body: _buildBody,
    );
  }

  get _buildBody{
    return ListView.builder(
      itemCount: data.districtPP.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("images/policeAvatar.jpg"),
            ),
            title: Text(data.districtPP[index]['dist']),
            subtitle: Text(data.districtPP[index]['phone']),
            trailing: IconButton(
              icon: Icon(Icons.phone),
              onPressed: (){
                _makePhoneCall('tel:${data.districtPP[index]['phone']}');
              },
            ),
          ),
        );
      },
    );
  }
}
