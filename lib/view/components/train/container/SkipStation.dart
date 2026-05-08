import 'package:app/view/components/train/cards/Timing.dart';
import 'package:app/view/components/train/cards/Name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../indicators/Dot.dart';

class HaltStation extends StatelessWidget{

  const HaltStation({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.green,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          Name(),
          Dot(),
          Timing()
        ],
      ),
    );
  }

}