import 'package:app/data/model/train/StationModel.dart';

import 'TrainModel.dart';

class JourneyDataModel {

  final TrainModel train;
  final List<StationModel> station;

  JourneyDataModel({required this.train, required this.station});
}
