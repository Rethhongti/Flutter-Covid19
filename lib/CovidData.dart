import 'package:http/http.dart';
import 'dart:convert';

class CovidData {
  var dataCam ;
  var worldDb ;
  requestDataCambodia() async{
    print("start");
    Response re = await get("https://corona.lmao.ninja/v3/covid-19/countries/Cambodia");
    dataCam = jsonDecode(re.body);
    print("ready");
  }


  requestWorldData() async{
    print("Worldstart");
    Response r = await get("https://corona.lmao.ninja/v3/covid-19/countries?sort=cases&fbclid=IwAR1W30UMpfSIK8IlKWDi-8Y5T_fcsSzOL7dQzgkheOnaQ30K8pWZP6iEx4s");
    worldDb = jsonDecode(r.body);
    print("Finish");
  }
}