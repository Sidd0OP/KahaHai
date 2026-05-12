import 'package:app/data/respository/train/TrainRepo.dart';
import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/container/TrainInfoExpanded.dart';
import 'package:app/view/components/train/map/MapDisplay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/model/train/TrainInfo.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {

  final TrainRepo _repo = TrainRepo();


  Future<void> loadTrainInfo() async
  {
    TrainInfo data = await _repo.getTrainInfo(12001, "2026-05-12");
    for (var s in data.station) {
      print(s.stationName);
    }
    print("Loaded Train Data");
  }


  @override
  void initState()
  {
    super.initState();
    loadTrainInfo();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: TrainInfoExpanded(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
