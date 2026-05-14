import 'package:app/data/model/train/StationModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Dot.dart';

class ThreeDots extends StatefulWidget {

  final Function(StationModel) onTap;
  final StationModel haltStation;

  const ThreeDots({
    super.key,
    required this.onTap,
    required this.haltStation
  });

  @override
  State<ThreeDots> createState() => _ThreeDotsState();
}

class _ThreeDotsState extends State<ThreeDots> {

  bool selectedState = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        setState(() {
          selectedState = true;
        });

        widget.onTap(widget.haltStation);
      },

      child: Container(
        // color: Colors.red,
        height: 100,
        child: Transform.translate(
          offset: Offset(0, -28),
          child: Row(spacing: 5, children: [Dot(), Dot(), Dot()]),
        ),
      ),
    );
  }
}
