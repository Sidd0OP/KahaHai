import '../../services/train/LiveMap.dart';

class TrainRepo{


  Future<Map<String , dynamic>> getAllTrainMapData() async
  {
    //final data = LiveMap().getAllTrainMapData();
    return LiveMap().getAllTrainMapData();
  }

}