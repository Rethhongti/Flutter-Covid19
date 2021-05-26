import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CovidContactScreen extends StatefulWidget {
  @override
  _CovidContactScreenState createState() => _CovidContactScreenState();
}

class _CovidContactScreenState extends State<CovidContactScreen> {

  var covidContact = [
    {
      "doctor": "លោកវេជ្ជបណ្ឌិត លី សូវ៉ាន់",
      "phone" : "012 825 424"
    },
    {
      "doctor": "លោកវេជ្ជបណ្ឌិត យី សេងឌឿន",
      "phone" : "012 488 981"
    },
    {
      "doctor": "លោកស្រីវេជ្ជបណ្ឌិត តេង ស្រី",
      "phone" : "012 836 868"
    },
    {
      "doctor": "115 ដោយឥតគិតថ្លៃ",
      "phone": "115"
    }
  ];
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
        backgroundColor: Colors.orange,
        title: Row(
          children: [
            Container(
              height: 60,
              child: Image.asset("images/covid.png",color: Colors.white),
            ),
            Text("Covid Contact"),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/banner2.jpg"),
                  fit: BoxFit.cover
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ប្រសិនបើអ្នកសង្ស័យថាមានផ្ទុកមេរោគ Covid19 សូមទាក់ទងទៅលេខៈ​",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("ទំនាក់ទំនងក្រសួងសុខាភិបាល",
              style: TextStyle(fontSize: 20),
            ),

            ...covidContact.map((i){
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("images/doctor.jpg"),
                  ),
                  title: Text(i['doctor']),
                  subtitle: Text(i['phone']),
                  trailing: IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: (){
                      _makePhoneCall('tel:${i['phone']}');
                    },
                  ),
                ),
              );
            } ).toList()
          ],
        ),
      ),
    );
  }
}
