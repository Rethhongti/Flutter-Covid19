import 'package:covid19/Cases.dart';
import 'package:covid19/CovidData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin{
  getData() async {
    CovidData cd = CovidData();
    await cd.requestDataCambodia();
    setState(() {
      hasData = true;
      country = cd.dataCam['country'];
      img = cd.dataCam['countryInfo']['flag'];
      total = cd.dataCam['cases'];
      today = cd.dataCam['todayCases'];
      recover = cd.dataCam['recovered'];
      todayDeath = cd.dataCam['todayDeaths'];
      death = cd.dataCam['deaths'];
      todayRecover = cd.dataCam['todayRecovered'];
      active = cd.dataCam['active'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  var img = "", total,today,recover,todayDeath,todayRecover,death,active;
  var country = "Loading..";
  bool hasData = false;

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
              Text("Covid 19"),
            ],
          ),
        ),
        body: hasData ? _bodyWithData : SpinKitFadingCircle(
          color: Colors.orange,
        ),
    );
  }

  get _bodyWithData {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            country,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image.network(img),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Cases(title: "Today",caseNum: today.toString(),clr: Colors.orange,),
              Cases(title: "Recovered",caseNum: recover.toString(),clr: Colors.green,),
              Cases(title: "Death",caseNum: death.toString(),clr: Colors.red,),
              Cases(title: "Total",caseNum: total.toString(),clr: Colors.red,),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.accessibility_new),
              title: Text("Today Recovered:"),
              subtitle: Text(todayRecover.toString()),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.airline_seat_flat),
              title: Text("Today Death:"),
              subtitle: Text(todayDeath.toString()),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.autorenew),
              title: Text("Active:"),
              subtitle: Text(active.toString()),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
