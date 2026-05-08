import 'package:app/view/appTheme.dart';
import 'package:app/view/components/train/cards/Station.dart';
import 'package:app/view/components/train/indicators/ThreeDots.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeLine extends StatelessWidget{

  const TimeLine({super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(

      alignment: Alignment.centerLeft,

      children: [
        //timeline
        Positioned(
          top: 73.8,
          left: 68,
          right: 68,
          child: Container(
            height: 12,
            decoration: BoxDecoration(
              color: context.tertiary,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),

        //stations
        Row(
          spacing: 20,
          children: [
            Station(),
            ThreeDots(),
            Station(),
            ThreeDots(),
            Station()
          ],
        )
      ],

    );
  }


}