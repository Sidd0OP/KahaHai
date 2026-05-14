import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/pill/StationInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class Timing extends StatelessWidget {
  final String scheduledArrival;
  final String scheduledDeparture;

  final String actualArrival;
  final String actualDeparture;

  final int delayDeparture;

  const Timing({
    super.key,
    required this.scheduledArrival,
    required this.scheduledDeparture,
    required this.actualArrival,
    required this.actualDeparture,
    required this.delayDeparture,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 120,

      padding: EdgeInsets.fromLTRB(12, 2, 8, 2),

      decoration: ShapeDecoration(
        color: context.secondary,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          smoothness: 0.6,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Scheduled", style: context.titleSmall),
          Text(
            "$scheduledArrival - $scheduledDeparture",
            style: context.titleMedium,
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              Text("Actual", style: context.titleSmall),
              Visibility(
                visible: delayDeparture > 0,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,child: StationInfo(isHalt: 0,value: delayDeparture,)
              ),
            ],
          ),
          Text("$actualArrival - $actualDeparture", style: context.titleMedium),
        ],
      ),
    );
  }
}
