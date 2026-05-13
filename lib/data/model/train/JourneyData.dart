import 'package:app/data/model/train/Station.dart';

import 'Train.dart';

class JourneyData {
  final Train train;
  final List<Station> station;

  JourneyData({required this.train, required this.station});
}
