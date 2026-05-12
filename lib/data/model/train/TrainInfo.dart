import 'package:app/data/model/train/Station.dart';

import 'Train.dart';

class TrainInfo {
  final Train train;
  final List<Station> station;

  TrainInfo({required this.train, required this.station});
}
