import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Dot.dart';

class ThreeDots extends StatelessWidget {
  const ThreeDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -28),
      child: Row(spacing: 5, children: [Dot(), Dot(), Dot()]),
    );
  }
}
