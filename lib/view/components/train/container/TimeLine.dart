import 'dart:collection';

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
  List<Widget> FINAL_TIMELINE_STATION_WIDGETS = [];

  List<StationModel> haltStationModelList = [];

  //all skip stations and three dots after current halt station
  Map<StationModel, List<StationModel>> skipStationsAfterHaltMap = {};
  Map<StationModel, Widget> threeDotsForHaltStationMap = {};

  //all enabled thee dots corresponding to the halt station
  HashSet<StationModel> enabledSet = HashSet();

  void fillTimeLineStationWidget() {
    for (StationModel halt in haltStationModelList)
    {

      FINAL_TIMELINE_STATION_WIDGETS.add(Station(stationModel: halt));

      if (enabledSet.contains(halt))
      {
        List<StationModel> skipStations = skipStationsAfterHaltMap[halt]!;
        for(StationModel skip in skipStations)
        {
          FINAL_TIMELINE_STATION_WIDGETS.add(Station(stationModel: skip));
        }

      }else{

        if(threeDotsForHaltStationMap.containsKey(halt))
        {
          FINAL_TIMELINE_STATION_WIDGETS.add(threeDotsForHaltStationMap[halt]!);
        }

      }
    }
  }

  void onThreeDotTap(StationModel haltStation) {

    print("onThreeDotTap");

    if (enabledSet.contains(haltStation))
    {
      enabledSet.remove(haltStation);
    } else {
      enabledSet.add(haltStation);
    }

    setState(() {
      //i forgor tis and i cry
      FINAL_TIMELINE_STATION_WIDGETS.clear();
      fillTimeLineStationWidget();
    });
  }

  @override
  void initState() {
    super.initState();

    StationModel currModel;
    StationModel? currHaltStation;
    bool threeDotsAssignedForCurrentHaltStation = false;

    for (int i = 0; i < widget.stationModels.length; i++)
    {
      currModel = widget.stationModels[i];

      //station type is halt
      if (currModel.isHalt == 1) {
        threeDotsAssignedForCurrentHaltStation = false;
        currHaltStation = currModel;

        haltStationModelList.add(currModel);
        skipStationsAfterHaltMap[currModel] = [];
      } else {

        //three dots will be assigned to those halt stations that have skip stations after them
        if (!threeDotsAssignedForCurrentHaltStation) {
          threeDotsForHaltStationMap[currHaltStation!] = ThreeDots(
            onTap: onThreeDotTap,
            haltStation: currHaltStation,
          );
          threeDotsAssignedForCurrentHaltStation = true;
        }

        skipStationsAfterHaltMap[currHaltStation]?.add(currModel);
      }
    }

    fillTimeLineStationWidget();


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
          Row(spacing: 20, children: FINAL_TIMELINE_STATION_WIDGETS),
        ],
      ),
    );
  }
}
