import 'package:app/data/model/train/TrainModel.dart';
import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/cards/Ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_corner/smooth_corner.dart';

class TrainInfoSmall extends StatefulWidget {
  final TrainModel train;

  const TrainInfoSmall({super.key, required this.train});

  @override
  State<TrainInfoSmall> createState() => _TrainInfoSmallState();
}

class _TrainInfoSmallState extends State<TrainInfoSmall> {
  Widget _progress(
    BuildContext context,
    int distanceTravelled,
    int totalDistance,
  ) {
    double widthPercent = (distanceTravelled / totalDistance);

    return Container(
      height: 48,
      // width: 100,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          smoothness: 0.6,
        ),
      ),

      child: Stack(
        children: [
          //base
          Container(color: context.primary),
          //top
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: widthPercent,
            child: Container(
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: context.onSurface,
                shape: SmoothRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  smoothness: 0.6,
                ),
              ),

              child: Text(
                "$distanceTravelled of $totalDistance km",
                style: context.labelMedium?.copyWith(color: context.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(16, 0, 16, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: _progress(context, 120, 200)),
              IconButton(
                onPressed: () {
                  TrainInfoCloseNotifier().dispatch(context);
                },
                icon: SvgPicture.asset(
                  width: 32.0,
                  height: 32.0,
                  'assets/svg/cross.svg',
                ),
              ),
            ],
          ),
        ),

        Ticket(train: widget.train),
      ],
    );
  }
}

class TrainInfoCloseNotifier extends Notification {}
