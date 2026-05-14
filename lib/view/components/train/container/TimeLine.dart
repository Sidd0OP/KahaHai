import 'package:app/data/model/train/StationModel.dart';
import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/container/Station.dart';
import 'package:app/view/components/train/indicators/ThreeDots.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeLine extends StatefulWidget {
  final List<StationModel> stationModels;

  const TimeLine({super.key, required this.stationModels});

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {

  List<Widget> timeLineChildren = [];
  List<StationModel> tempSkipStationsList = [];

  Map<int, List<Widget>> skipStationMap = {};
  int haltStationIndex = 0;

  void onThreeDotTap(int haltStationIndex)
  {
    //add skip stations to timeLine
    setState(() {

      timeLineChildren.insertAll(haltStationIndex + 1, skipStationMap[haltStationIndex]!);

    });
  }


  @override
  void initState() {
    super.initState();

    bool beforeIsHaltStation = false;

    for (int i = 0; i < widget.stationModels.length; i++) {
      StationModel model = widget.stationModels[i];

      if (model.isHalt == 1)
      {

        timeLineChildren.add(Station(stationModel: model));


        if(tempSkipStationsList.isNotEmpty)
        {
          List<Widget> skipStations = tempSkipStationsList
              .map((model) => Station(stationModel: model))
              .toList();

          skipStationMap[haltStationIndex] = skipStations;
          tempSkipStationsList.clear();
        }


        beforeIsHaltStation = true;
        haltStationIndex++;

      } else {
        if (beforeIsHaltStation) {
          timeLineChildren.add(
            ThreeDots(haltStationIndex: haltStationIndex, onTap: onThreeDotTap),
          );
          beforeIsHaltStation = false;
        }

        tempSkipStationsList.add(model);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(0, 6, 0, 0),
      child: Stack(
        alignment: Alignment.centerLeft,

        children: [
          //timeline
          Positioned(
            top: 73.8,
            left: 68,
            right: 68,
            child: Container(
              height: 12,
              decoration: BoxDecoration(
                color: context.tertiary,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),

          //stations
          Row(spacing: 20, children: timeLineChildren),
        ],
      ),
    );
  }
}
