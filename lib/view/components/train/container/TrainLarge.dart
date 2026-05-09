import 'dart:ffi';

import 'package:app/view/components/train/cards/Timing.dart';
import 'package:app/view/components/train/cards/Name.dart';
import 'package:app/view/components/train/container/TimeLine.dart';
import 'package:app/view/components/train/container/TrainSmall.dart';
import 'package:app/view/components/train/pill/Heading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrainLarge extends StatelessWidget{

  const TrainLarge({super.key});


  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
      ),

      child: Column(

        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        spacing: 14,

        children: [
          LargeContainerHeading(),
          //time line
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 2,
              ),
              children: [
                Center(
                  child: TimeLine(),
                )
                ],
            ),
          ),
          TrainSmall(child: Text("data")),
        ],
      ),
    );
  }

}