import 'package:covid19/CovidData.dart';
import 'package:covid19/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorldScreen extends StatefulWidget {
  @override
  _WorldScreenState createState() => _WorldScreenState();
}

class _WorldScreenState extends State<WorldScreen> with AutomaticKeepAliveClientMixin{
  var dbw;
  var mainList;
  var filterSearch;
  bool isSearch = false;
  bool hasData = false;
  getData() async{
    CovidData cd = CovidData();
    await cd.requestWorldData();
    setState(() {
      dbw = cd.worldDb;
      hasData = true;
      mainList = dbw;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void searchCountry(value){
    if(value.isNotEmpty){
      filterSearch = dbw.where((x)=> x['country'].toString().toLowerCase().startsWith(value.toLowerCase()));
      setState(() {
        mainList = filterSearch.toList();
      });
    }else{
      setState(() {
        mainList = dbw;
      });
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
              child: Image.asset("images/covid.png",color: Colors.white,),
            ),
            SizedBox(
              width: 5,
            ),
            isSearch ? _buildSearchBox : Text("World"),
          ],
        ),
        actions: [
          Container(
            width: 40,
            child: IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                  setState(() {
                    isSearch = !isSearch;
                  });
                },
            ),
          ),
        ],
      ),
      body: hasData ? _buildTableBody : SpinKitCircle(color: Colors.orange,),
      //body: _buildBodyTable,
    );
  }
  get _buildTableBody{
    return SingleChildScrollView(
      child: DataTable(
        columnSpacing: 6,
          columns: [
            DataColumn(label: Text("Country")),
            DataColumn(label: Text("Today",style: TextStyle(color: Colors.orange),)),
            DataColumn(label: Text("Recovered",style: TextStyle(color: Colors.green),)),
            DataColumn(label: Text("Total",style: TextStyle(color: Colors.red),)),
          ],
          rows: <DataRow>[
            ...mainList.map((el){
              return DataRow(
                  cells: [
                    DataCell(Row(
                      children: [
                        Container(
                          child: Image.network(el['countryInfo']['flag']),
                          width: 33,
                        ),
                        SizedBox(width: 3,),
                        Container( width: 100,child: Text(el['country'],overflow: TextOverflow.ellipsis,)),
                      ],
                    )),
                    DataCell(Text(el['todayCases'].toString(),style: TextStyle(color: Colors.orange))),
                    DataCell(Text(el['recovered'].toString(),style: TextStyle(color: Colors.green))),
                    DataCell(Text(el['cases'].toString(),style: TextStyle(color: Colors.red))),
                  ]
              );
            }).toList()
          ],
      ),
    );
  }
  get _buildSearchBox{
    return Container(
      height: 50,
      width: 270,
      child: TextFormField(
        autofocus: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Search Country",
          hintStyle: TextStyle(fontSize: 18,color: Colors.white),
        ),
        onChanged: (value) {
          searchCountry(value);
        },
      ),
    );
  }

  get _buildBody{
    return ListView.builder(
      itemCount: mainList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(mainList[index]['countryInfo']['flag'].toString()),
            ),
            title: Text(mainList[index]['country']),
          );
        },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
