import 'package:app/data/model/train/StationModel.dart';
import 'package:app/data/model/train/TrainModel.dart';
import 'package:app/data/respository/TrainRepo.dart';
import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/container/TrainInfoExpanded.dart';
import 'package:app/view/components/train/map/MapDisplay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/model/train/JourneyModel.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  final TrainRepo _repo = TrainRepo();

  TrainModel? train;
  List<StationModel> stations = [];

  Future<void> loadTrainInfo() async {
    JourneyDataModel data = await _repo.getJourneyData(12001, "2026-05-12");

    setState(() {
      train = data.train;
      stations = data.station;
    });
  }

  @override
  void initState() {
    super.initState();
    loadTrainInfo();
  }

  @override
  Widget build(BuildContext context) {
    if (train == null) {
      return Text("Not loaded yet");
    } else {
      return
        Container(
        color: context.primary,
        child: SafeArea(
          top: false,
          left: false,
          right: false,
          child: Scaffold(
            backgroundColor: context.primary,
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                MapDisplay(),
                NotificationListener<TrainInfoCloseNotifier>(
                  onNotification: (notification) {
                    Navigator.pushNamed(context, "/SearchPage");
                    return true;
                  },
                  child: TrainInfoExpanded(train: train!, stations: stations),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
