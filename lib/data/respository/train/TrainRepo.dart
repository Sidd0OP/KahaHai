import 'package:app/data/model/train/MapMarker.dart';
import 'package:app/data/model/train/Station.dart';

import '../../model/train/Train.dart';
import '../../model/train/TrainInfo.dart';
import '../../services/TrainService.dart';

class TrainRepo {
  Future<List<MapMarker>> getAllTrainMapMarkers() async {
    final jsonObject = await TrainService().getAllTrainMapData();

    if (jsonObject["success"] != true) {
      //throw exception
    }

    List<dynamic> trainData = jsonObject["data"];

    return trainData
        .where((trainJson) {
          return trainJson["current_lat"] != null &&
              trainJson["current_lng"] != null &&
              trainJson["next_lat"] != null &&
              trainJson["next_lng"] != null;
        })
        .map((train) => MapMarker.fromJson(train))
        .toList();
  }

  Future<TrainInfo> getTrainInfo(int trainNumber, String date) async {
    final jsonObject = await TrainService().getTrainData(
      "static",
      "12001",
      "2026-05-12",
    );

    if (jsonObject["success"] != true)
    {
      //throw exception
    }

    Map<String, dynamic> trainData = jsonObject["data"];

    //Train data
    Train train = Train.fromJson(trainData["train"]);

    //Train station data
    List<Station> stations = (trainData["route"] as List<dynamic>)
        .map((stationObject) => Station.fromJson(stationObject))
        .toList();



    return TrainInfo(train: train, station: stations);
  }
}
