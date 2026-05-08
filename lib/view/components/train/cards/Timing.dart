import 'package:app/view/appTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class Timing extends StatelessWidget{

  const Timing({super.key});


  @override
  Widget build(BuildContext context) {

    return Container(

      width: 150,
      height: 90,

      padding: EdgeInsets.fromLTRB(8, 5, 8, 5),

      decoration: ShapeDecoration(
        color: context.secondary,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          smoothness: 1,
        ),
      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Scheduled" , style: context.titleSmall),
          Text("11:00am - 11:59am", style: context.titleMedium),
          Text("Actual" , style: context.titleSmall),
          Text("11:00am - 11:59am", style: context.titleMedium,)
        ],
      ),

    );
  }


}