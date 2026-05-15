import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class Heading extends StatelessWidget{

  final String trainNumber;
  const Heading({super.key, required this.trainNumber});

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
        height: 48.0,
        // constraints: BoxConstraints(maxWidth: 91),
        // alignment: Alignment.center,

        decoration: ShapeDecoration(
          color: color.tertiary,
          shape: SmoothRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            smoothness: 1,
          ),

        ),

        padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                trainNumber,
                style: textTheme.headlineLarge
            )
          ],
        )
    );
  }

}