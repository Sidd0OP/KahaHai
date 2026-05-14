import 'package:app/data/model/train/PositionModel.dart';
import 'package:app/data/model/train/StationModel.dart';

import '../model/train/TrainModel.dart';
import '../model/train/JourneyModel.dart';
import '../services/TrainService.dart';

class TrainRepo {


  Future<List<PositionModel>> getAllTrainPositions() async
  {
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
        .map((train) => PositionModel.fromJson(train))
        .toList();
  }


  //------------------------------------------------------------------------

  /*


    ----------------------------------------------------------------
      Working Method

      1. Get Full train data
      2. Create the Train object and Station objects from static data
      3. Update the objects with live data
      4. Return the JourneyData object
     ---------------------------------------------------------------


     */

  Future<JourneyDataModel> getJourneyData(int trainNumber, String date) async {
    final jsonObject = await TrainService().getTrainData(
      "full",
      "12001",
      "2026-05-12",
    );

    if (jsonObject["success"] != true)
    {
      //throw exception
    }

    Map<String, dynamic> trainData = jsonObject["data"];

    //Train from train
    TrainModel train = TrainModel.fromJson(trainData["train"]);

    //Stations from route
    List<StationModel> stations = (trainData["route"] as List<dynamic>)
        .map((stationObject) => StationModel.fromJson(stationObject))
        .toList();

    Map<String, StationModel> stationCodeMap = {};
    for (StationModel model in stations) {
      stationCodeMap[model.stationCode] = model;
    }


    if ((trainData["metadata"] as Map<String, dynamic>)["hasLiveData"]) {
      Map<String, dynamic> liveData = trainData["liveData"];
      Map<String, dynamic> liveLocation = liveData["currentLocation"];

      //Update Train Details with live details
      train.updateLiveDetails(liveData, liveLocation);

      List<dynamic> liveStations = liveData["route"];

      //Update Station Details with live details
      _updateStationLiveDetails(liveStations, stationCodeMap);
    }

    return JourneyDataModel(train: train, station: stations);
  }

  //------------------------------------------------------------------------

  Future<void> getOnlyLiveJourneyData(TrainModel train,
      List<StationModel> stations,) async {}


//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


  void _updateStationLiveDetails(
      List<dynamic> liveStations,
      Map<String, StationModel> stationCodeMap
      )
  {
    for (int i = 0; i < liveStations.length; i++) {
      Map<String, dynamic> liveStation = liveStations[i];

      stationCodeMap[liveStation["stationCode"]]?.updateLiveStationInfo(liveStation);

    }
  }
}




