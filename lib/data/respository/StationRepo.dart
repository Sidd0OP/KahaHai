import 'dart:collection';
import 'dart:convert';

import 'package:app/data/model/train/StationMarkerModel.dart';
import 'package:flutter/services.dart';

class StationRepo {


  final Map<String , StationMarkerModel> stationMarkerMap = {};
  bool loadedStations =  false;

  //noice finally java
  StationRepo() {
    _loadJson();
  }

  Future<void> _loadJson() async {

    final jsonString = await rootBundle.loadString('assets/data/stations.json');

    List<dynamic> jsonList = jsonDecode(jsonString);

    StationMarkerModel model;

    for (var jsonObject in jsonList)
    {
      //duct tape code
      if(jsonObject == null)continue;

      model = StationMarkerModel.fromJson(jsonObject as Map<String, dynamic>);
      stationMarkerMap[model.stationCode] = model;
    }

    loadedStations = true;

  }

                      // it helps
  StationMarkerModel? getStationMarkerFromStationCode(String stationCode)
  {
    if(!loadedStations)return null;
    return stationMarkerMap[stationCode];
  }

}
