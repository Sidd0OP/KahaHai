import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/pill/StationInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class Timing extends StatelessWidget{



  const Timing({super.key});




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
          Text("Scheduled" , style: context.titleSmall),
          Text("11:00am - 11:59am", style: context.titleMedium),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              Text("Actual" , style: context.titleSmall),
              Info()
            ],
          ),
          Text("11:00am - 11:59am", style: context.titleMedium,)
        ],
      ),

    );
  }


}