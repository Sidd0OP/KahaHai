import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Dot.dart';

class ThreeDots extends StatelessWidget {
  final Function(int) onTap;
  final int haltStationIndex;

  const ThreeDots({
    super.key,
    required this.onTap,
    required this.haltStationIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(haltStationIndex),

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
