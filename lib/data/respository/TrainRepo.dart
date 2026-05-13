import 'package:app/data/model/train/TrainPosition.dart';
import 'package:app/data/model/train/Station.dart';

import '../model/train/Train.dart';
import '../model/train/JourneyData.dart';
import '../services/TrainService.dart';

class TrainRepo {


  Future<List<TrainPosition>> getAllTrainPositions() async
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
        .map((train) => TrainPosition.fromJson(train))
        .toList();
  }


  //------------------------------------------------------------------------


  Future<JourneyData> getJourneyData(int trainNumber, String date) async {
    /*


    ----------------------------------------------------------------
      Working Method

      1. Get Full train data
      2. Create the Train object and Station objects from static data
      3. Update the objects with live data
      4. Return the JourneyData object
     ---------------------------------------------------------------


     */

    final jsonObject = await TrainService().getTrainData(
      "full",
      "12001",
      "2026-05-12",
    );

    if (jsonObject["success"] != true) {
      //throw exception
    }

    Map<String, dynamic> trainData = jsonObject["data"];

    //Train from train
    Train train = Train.fromJson(trainData["train"]);

    //Stations from route
    List<Station> stations = (trainData["route"] as List<dynamic>)
        .map((stationObject) => Station.fromJson(stationObject))
        .toList();

    if ((trainData["metadata"] as Map<String, dynamic>)["hasLiveData"])
    {
      Map<String, dynamic> liveData = trainData["liveData"];
      Map<String, dynamic> liveLocation = liveData["currentLocation"];

      //Update Train Details with live details
      train.updateLiveDetails(liveData, liveLocation);

      List<dynamic> liveStations = liveData["route"];

      //Update Station Details with live details
      _updateStationLiveDetails(liveStations, stations);
    }

    return JourneyData(train: train, station: stations);
  }

  //------------------------------------------------------------------------

  Future<void> getOnlyLiveJourneyData(
      Train train,
      List<Station> stations,
      ) async {}


  void _updateStationLiveDetails(
      List<dynamic> liveStations,
      List<Station> stations,
      ) {
    for (int i = 0; i < liveStations.length; i++) {
      Map<String, dynamic> liveStation = liveStations[i];

      int staticStationIndex = 1;
      int liveStationIndex = liveStation["sequence"] as int;

      while (true) {
        if (staticStationIndex < liveStationIndex) {
          staticStationIndex++;
          continue;
        }

        if (staticStationIndex > stations.length ||
            staticStationIndex > liveStationIndex) {
          break;
        }

        //Update station with live Details
        stations[staticStationIndex].updateLiveStationInfo(liveStation);
        staticStationIndex++;
      }
    }
  }

}


