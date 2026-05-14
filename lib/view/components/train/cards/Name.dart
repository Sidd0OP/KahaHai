import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/pill/StationInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widget_previews.dart';
import 'package:smooth_corner/smooth_corner.dart';

class Name extends StatelessWidget {
  final String name;
  final int isHalt;

  final int platform;
  final int delayDeparture;

  const Name({
    super.key,
    required this.name,
    required this.isHalt,
    required this.platform,
    required this.delayDeparture,
  });

  @override
  Widget build(BuildContext context) {
    bool showInfoPill = true;
    int value = 0;

    if (isHalt != 1 && delayDeparture == 0) showInfoPill = false;

    if (isHalt == 1) {
      value = platform;
    } else {
      value = delayDeparture;
    }

    return Container(
      height: 64,
      width: 170,

      decoration: ShapeDecoration(
        color: context.secondary,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          smoothness: 0.6,
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(name, style: context.titleLarge),

          //if halt then show platform, if skip and delay then show delay else hide info pill
          Visibility(
            visible: showInfoPill,
            maintainSize: false,
            maintainAnimation: true,
            maintainState: true,
            child: StationInfo(isHalt: isHalt, value: value),
          ),
        ],
      ),
    );
  }
}

//
//
// @Preview()
// Widget previewStationName() {
//   return const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Scaffold(
//       body: Center(
//         child: Name(),
//       ),
//     ),
//   );
// }
