import 'dart:ffi';

import 'package:app/data/model/train/StationModel.dart';
import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/cards/Timing.dart';
import 'package:app/view/components/train/cards/Name.dart';
import 'package:app/view/components/train/container/TimeLine.dart';
import 'package:app/view/components/train/cards/Floater.dart';
import 'package:app/view/components/train/cards/Ticket.dart';
import 'package:app/view/components/train/pill/Heading.dart';
import 'package:app/view/components/train/pill/Pill.dart';
import 'package:app/view/components/train/pill/SourceDestination.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../../../data/model/train/TrainModel.dart';

class TrainInfoLarge extends StatefulWidget {

  final TrainModel train;
  final List<StationModel> stations;
  final VoidCallback onTapCallback;

  const TrainInfoLarge({
    super.key,
    required this.train,
    required this.stations,
    required this.onTapCallback
  });

  @override
  State<TrainInfoLarge> createState() => _TrainInfoLargeState();
}

class _TrainInfoLargeState extends State<TrainInfoLarge> {

  @override
  void initState() {
    super.initState();
  }

  //required for refresh icon animation
  double turns = 0;

  void onTicketTapCallback() => widget.onTapCallback();

  @override
  Widget build(BuildContext context) {
    final String trainName = widget.train.trainName;
    final String trainNumber = widget.train.trainNumber;

    final String sourceStationCode = widget.train.sourceStationCode;
    final String destinationStationCode = widget.train.destinationStationCode;

    //temporary
    final String departure = widget.stations[0].scheduledDeparture;
    final String arrival = widget.stations.last.scheduledArrival;

    return SafeArea(
      bottom: true,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          spacing: 14,

          children: [
            //header
            // Give data from Train Dao....
            Stack(
              alignment: Alignment.center,
              children: [
                // side widgets
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 32, 0),
                  child: Row(
                    children: [
                      Text("+ 20m", style: context.titleMedium),

                      Spacer(),

                      IconButton(
                        onPressed: () {
                          //create refresh mechanism, update live data
                          setState(() {
                            turns += 1;
                          });

                        },
                        icon: AnimatedRotation(
                          turns: turns,
                          duration: Duration(milliseconds: 420),
                          curve: Curves.easeInOut,

                          child: SvgPicture.asset(
                            'assets/svg/refresh_icon.svg',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // absolute center
                Heading(trainNumber: trainNumber),
              ],
            ),

            //time line
            //Give Data from Route Dao
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  Center(child: TimeLine(stationModels: widget.stations)),
                ],
              ),
            ),

            //bottom floater
            Ticket(
              train: widget.train,
              ticketColor: context.tertiary,
              sourceDestinationColor: context.primary,
              onTicketTapCallback: onTicketTapCallback,
            ),
          ],
        ),
      ),
    );
  }
}
