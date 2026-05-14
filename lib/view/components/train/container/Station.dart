import 'package:app/data/model/train/StationModel.dart';
import 'package:app/view/components/train/cards/Timing.dart';
import 'package:app/view/components/train/cards/Name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../indicators/Dot.dart';

class Station extends StatelessWidget {
  final StationModel stationModel;

  const Station({super.key, required this.stationModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          Name(
            name: stationModel.stationName,
            isHalt: stationModel.isHalt,
            platform: stationModel.platform,
            delayDeparture: stationModel.delayDeparture,
          ),

          Dot(),

          Visibility(
            visible: true,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Timing(
              scheduledArrival: stationModel.scheduledArrival,
              scheduledDeparture: stationModel.scheduledDeparture,
              actualArrival: stationModel.actualArrival,
              actualDeparture: stationModel.actualDeparture,

              delayDeparture: stationModel.delayDeparture,
            ),
          ),
        ],
      ),
    );
  }
}
