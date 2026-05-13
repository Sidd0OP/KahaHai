import 'package:app/data/model/train/Station.dart';
import 'package:app/view/components/train/cards/Timing.dart';
import 'package:app/view/components/train/cards/Name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../indicators/Dot.dart';

class StationHalt extends StatelessWidget{

  final Station station;
  const StationHalt({super.key, required this.station});

  @override
  Widget build(BuildContext context) {

    return Container(
      // color: Colors.green,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [

          Name(name: station.stationName),

          Dot(),

          Timing(scheduledArrival: station.scheduledArrival,
          scheduledDeparture: station.scheduledDeparture,
          actualArrival: station.actualArrival ?? " ",
          actualDeparture: station.actualDeparture ?? " ")
        ],
      ),
    );
  }

}