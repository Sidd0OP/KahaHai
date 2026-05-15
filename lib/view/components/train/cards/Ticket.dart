import 'package:app/data/model/train/TrainModel.dart';
import 'package:app/view/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_corner/smooth_corner.dart';

import 'Floater.dart';

class Ticket extends StatelessWidget {


  final TrainModel train;

  const Ticket({
    super.key,
    required this.train
  });

  Widget _sourceDestinationTime(
    BuildContext context,
    Color color,
    String location,
    String time,
  ) {
    return Container(
      // height: 48,
      constraints: const BoxConstraints(minWidth: 140, maxWidth: 140),
      padding: EdgeInsets.fromLTRB(20, 4, 20, 4),
      decoration: ShapeDecoration(
        color: color,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          smoothness: 0.6,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            location,
            style: context.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            time,
            style: context.titleSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    String trainName = train.trainName;
    String sourceStationCode = train.sourceStationCode;
    String destinationStationCode = train.destinationStationCode;

    //temporary
    String departure = "20 Nov, 11:59pm";
    String arrival = "20Nov, 10:00am";


    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(16, 0, 16, 0),
      child: Floater(
        color: context.tertiary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 14,
          children: [

            Text(trainName, style: context.headlineLarge),

            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //source
                _sourceDestinationTime(
                  context,
                  context.primary,
                  sourceStationCode,
                  departure,
                ),

                //arrow container
                Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: context.onSurface,
                    shape: SmoothRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      smoothness: 0.6,
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/svg/arrow.svg",
                    width: 16,
                    height: 16,
                  ),
                ),

                //destination
                _sourceDestinationTime(
                  context,
                  context.primary,
                  destinationStationCode,
                  arrival,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
