import 'package:app/view/components/train/cards/Timing.dart';
import 'package:app/view/components/train/cards/Name.dart';
import 'package:app/view/components/train/indicators/TimeLine.dart';
import 'package:app/view/components/train/pill/largeContainerHeading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LargeContainer extends StatelessWidget{

  const LargeContainer({super.key});


  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      // alignment: AlignmentDirectional.bottomCenter,
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,

        spacing: 5,

        children: [
          LargeContainerHeading(),
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
                // Center(child: StationName()),
                // Center(child: StationName()),
                // Center(child: StationName()),
                // Center(child: StationName()),

              ],
            ),
          )
        ],
      ),
    );
  }

}