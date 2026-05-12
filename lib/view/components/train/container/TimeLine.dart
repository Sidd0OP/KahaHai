import 'package:app/data/model/train/Station.dart';
import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/container/StationHalt.dart';
import 'package:app/view/components/train/indicators/ThreeDots.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'StationSkip.dart';

class TimeLine extends StatefulWidget {

  final List<Station> stations;

  const TimeLine({super.key, required this.stations});



  @override
  State<TimeLine> createState() => _TimeLineState();
}


class _TimeLineState extends State<TimeLine>
{


  @override
  Widget build(BuildContext context)
  {
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
          Row(
            spacing: 20,
            children: widget.stations.map((station) => (StationHalt(name: station.stationName))).toList(),
          ),
        ],
      ),
    );
  }

}































