import 'package:app/view/components/train/cards/Timing.dart';
import 'package:app/view/components/train/cards/Name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../indicators/Dot.dart';

class StationHalt extends StatelessWidget{

  final String name;
  const StationHalt({super.key, required this.name});

  @override
  Widget build(BuildContext context) {

    return Container(
      // color: Colors.green,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          Name(name: name),
          Dot(),
          Timing()
        ],
      ),
    );
  }

}