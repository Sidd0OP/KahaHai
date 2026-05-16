import 'package:app/data/model/train/StationModel.dart';
import 'package:app/data/model/train/TrainModel.dart';
import 'package:app/data/respository/TrainRepo.dart';
import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/container/TrainInfoLarge.dart';
import 'package:app/view/components/train/cards/Ticket.dart';
import 'package:app/view/components/train/container/TrainInfoSmall.dart';
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
  bool expandedState = false;

  final TrainRepo _repo = TrainRepo();

  TrainModel? train;
  List<StationModel> stations = [];

  //cool
  void onTapCallback() {
    expandedState = !expandedState;
    setState(() {});
  }

  void onCancelCallback() {
    Navigator.pushNamed(context, "/SearchPage");
  }

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
      return Container(
        color: context.primary,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            MapDisplay(),

            AnimatedSlide(
              curve: Curves.easeInOutCubic,
              offset: expandedState ? Offset(0, 1) : Offset.zero,
              duration: Duration(milliseconds: 880),

              child: TrainInfoSmall(
                train: train!,
                onTapCallback: onTapCallback,
                onCancelCallback: onCancelCallback,
              ),
            ),

            AnimatedSlide(
              curve: Curves.easeInOutCubic,
              offset: expandedState ? Offset.zero : Offset(0, 1),
              duration: Duration(milliseconds: 640),

              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(height: 100, color: context.primary),
                  TrainInfoLarge(
                    train: train!,
                    stations: stations,
                    onTapCallback: onTapCallback,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
