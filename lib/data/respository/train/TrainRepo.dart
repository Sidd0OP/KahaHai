import 'package:app/data/model/train/MapMarker.dart';

import '../../services/train/LiveMap.dart';

class TrainRepo {
  Future<List<MapMarker>> getAllTrainMapMarkers() async {
    final jsonObject = await LiveMap().getAllTrainMapData();
    // List<MapMarker> markers = [];

    if (jsonObject["success"] != true) {
      //throw exception
    }

    List<dynamic> trainData = jsonObject["data"];
    // markers.add(MapMarker.fromJson(trainData[0]));
    return trainData
        .where((trainJson) {
          return trainJson["current_lat"] != null &&
              trainJson["current_lng"] != null &&
              trainJson["next_lat"] != null &&
              trainJson["next_lng"] != null;
        })
        .map((train) => MapMarker.fromJson(train))
        .toList();
    //return markers;
  }
}
