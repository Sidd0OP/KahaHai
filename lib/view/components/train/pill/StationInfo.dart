import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class Info extends StatelessWidget{

  const Info({super.key});

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 45,
      height: 19,

      decoration: ShapeDecoration(
        color: color.tertiary,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          smoothness: 1,
        ),
      ),

      child: Center(child: Text("Pfm. 1" , style: textTheme.labelSmall,)),

    );
  }

}