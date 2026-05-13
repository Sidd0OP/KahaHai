import 'package:app/view/components/train/cards/Timing.dart';
import 'package:app/view/components/train/cards/Name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../indicators/Dot.dart';

class StationSkip extends StatelessWidget{

  final String name;
  const StationSkip({super.key, required this.name});

  @override
  Widget build(BuildContext context) {

    return Container(
      // color: Colors.green,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          Name(name: this.name,),
          Dot(),
          // Visibility(
          //   visible: false,
          //   maintainSize: true,
          //   maintainAnimation: true,
          //   maintainState: true,
          //   // child: Timing(),
          // )
        ],
      ),
    );
  }

}