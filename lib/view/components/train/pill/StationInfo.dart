import 'package:app/view/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class StationInfo extends StatelessWidget {
  //time or platfrom
  final int value;
  final int isHalt;

  const StationInfo({super.key, required this.isHalt, required this.value});

  @override
  Widget build(BuildContext context) {
    String displayText = "";

    //delay
    if ((isHalt == 0) && value > 0) {
      //work on it for hour also
      displayText = "+ ${value}m";
    } else {
      displayText = "Pfm. $value";
    }

    return Container(
      width: 45,
      height: 19,

      decoration: ShapeDecoration(
        //if its not a halt and delay is 0 then this widget would not be shown this no need to worry about the color
        color: isHalt == 1 ? context.tertiary : context.error,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          smoothness: 1,
        ),
      ),

      child: Center(child: Text(displayText, style: context.labelSmall)),
    );
  }
}
