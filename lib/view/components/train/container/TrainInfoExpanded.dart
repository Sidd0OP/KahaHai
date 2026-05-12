import 'dart:ffi';

import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/cards/Timing.dart';
import 'package:app/view/components/train/cards/Name.dart';
import 'package:app/view/components/train/container/TimeLine.dart';
import 'package:app/view/components/train/cards/Floater.dart';
import 'package:app/view/components/train/pill/Heading.dart';
import 'package:app/view/components/train/pill/Pill.dart';
import 'package:app/view/components/train/pill/SourceDestination.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_corner/smooth_corner.dart';

class TrainInfoExpanded extends StatefulWidget {

  const TrainInfoExpanded({super.key});

  @override
  State<TrainInfoExpanded> createState() => _TrainInfoExpandedState();

}

class _TrainInfoExpandedState extends State<TrainInfoExpanded> {

  Widget _sourceDestinationTime(
      BuildContext context,
      Color color,
      String location,
      String time,
      )
  {
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
  void initState()
  {
    super.initState();

  }

  @override
  Widget build(BuildContext context)
  {
    return Container(
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
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 42),
                    child: Text("+ 20m", style: context.titleMedium),
                  ),

                  Spacer(),

                  IconButton(
                    padding: EdgeInsets.only(right: 20),
                    onPressed: () {
                      TrainInfoCloseNotifier().dispatch(context);
                    },
                    icon: SvgPicture.asset('assets/svg/cross.svg'),
                  ),
                ],
              ),

              // absolute center
              Heading(),
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
              children: [Center(child: TimeLine())],
            ),
          ),

          //bottom floater
          //Give Data from Train Dao....
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(16, 0, 16, 0),
            child: Floater(
              color: context.tertiary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 14,
                children: [
                  Text("12001 Bhopal Shatabdi", style: context.headlineLarge),
                  Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //source
                      _sourceDestinationTime(
                        context,
                        context.primary,
                        "NDLS",
                        "20Nov, 11:59pm",
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
                        // child: SvgPicture.asset(
                        //   "assets/svg/cross.svg",
                        //   width: 24,
                        //   height: 24,
                        //
                        // ),
                      ),

                      //destination
                      _sourceDestinationTime(
                        context,
                        context.primary,
                        "RKMP",
                        "20Nov, 11:59pm",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}


class TrainInfoCloseNotifier extends Notification {

}
